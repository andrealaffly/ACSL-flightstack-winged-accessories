#!/usr/bin/env python3
# ***********************************************************************************************************************
# Copyright (c) 2024 Giri M. Kumar, Mattia Gramuglia, Andrea L'Afflitto. All rights reserved.
# 
# Redistribution and use in source and binary forms, with or without modification, are permitted provided that the
# following conditions are met:
# 
# 1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following
#    disclaimer.
# 
# 2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the
#    following disclaimer in the documentation and/or other materials provided with the distribution.
# 
# 3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote
#    products derived from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES,
# INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
# SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
# SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
# ***********************************************************************************************************************

# ***********************************************************************************************************************
# File:     weatherSTEM.py
# Author:   Giri Mugundan Kumar
# Date:     February 24, 2025
# For info: Andrea L'Afflitto
#           a.lafflitto@vt.edu
# 
# Description: Weather data processing and UDP communication that sends the data from the groundstation to the drone.
# 
# GitHub: https://github.com/andrealaffly/ACSL-flightstack-winged-accessories
# ***********************************************************************************************************************

import urllib.request
import json
import time
import math
import yaml
import traceback
import socket

# Load configurations from YAML
def load_config(config_file="config.yaml"):
    """
    Load configuration parameters from a YAML file.
    
    Args:
        config_file (str): Path to the configuration file
        
    Returns:
        dict: Dictionary containing configuration parameters
    """
    with open(config_file, "r") as file:
        return yaml.safe_load(file)

# Define sensor names with conversion functions
REQUIRED_SENSORS = {
    # Convert mph to m/s (1 mph = 0.44704 m/s)
    "10 Minute Wind Gust": {"convert": lambda x: x * 0.44704},        # m/s
    "Anemometer": {"convert": lambda x: x * 0.44704},                 # m/s
    # Convert inHg to Pascals (1 inHg = 3386.39 Pa)
    "Barometer": {"convert": lambda x: x * 3386.39},                  # Pa
    # Convert Fahrenheit to Celsius
    "Thermometer": {"convert": lambda x: round((x - 32) * 5/9, 2)},   # Celsius
    # Convert degrees to radians (meteorological convention: 0° = North, 90° = East)
    "Wind Vane": {"convert": lambda x: round(x * math.pi / 180, 4)},  # Radians
}

# Persistent HTTP connection with auto-recovery
class PersistentHTTP:
    """
    Manages a persistent HTTP connection with automatic recovery for network issues.
    Maintains connection state and provides methods for data retrieval.
    """
    def __init__(self):
        """Initialize the HTTP connection."""
        self.create_opener()

    def create_opener(self):
        """
        Create a new HTTP connection opener with keep-alive header.
        Called during initialization and after connection errors.
        """
        self.opener = urllib.request.build_opener()
        self.opener.addheaders = [("Connection", "keep-alive")]

    def fetch(self, url, data):
        """
        Fetch data from the API, with automatic retry logic.
        
        Args:
            url (str): The API endpoint URL
            data (dict): The request payload
            
        Returns:
            dict or None: The API response as a dictionary, or None if the request failed
        """
        try:
            request = urllib.request.Request(
                url,
                data=json.dumps(data).encode("utf-8"),
                headers={"Content-Type": "application/json"}
            )
            with self.opener.open(request) as response:
                return json.load(response)
        except urllib.error.HTTPError as e:
            print(f"HTTP Error {e.code}: {e.reason}")
            if e.code == 503:
                # Service unavailable - wait and retry
                time.sleep(3)
            # Reset connection on any HTTP error
            self.create_opener()
        except Exception as e:
            print(f"Unexpected Error: {e}")
            traceback.print_exc()
            # Reset connection on any exception
            self.create_opener()
        return None

# Fetch weather data
def fetch_weather_data(http_client, api_key, station):
    """
    Retrieve weather data from the WeatherStem API.
    
    Args:
        http_client (PersistentHTTP): The HTTP client object
        api_key (str): API key for authentication
        station (str): Weather station identifier
        
    Returns:
        list or None: List of sensor readings if successful, None otherwise
    """
    url = "https://api.weatherstem.com/api"
    indata = {"api_key": api_key, "stations": [station]}

    result = http_client.fetch(url, indata)
    # Validate response structure before returning
    if result and isinstance(result, list) and result and "record" in result[0] and "readings" in result[0]["record"]:
        return result[0]["record"]["readings"]

    print("Warning: No valid response received.")
    return None

# Compute U, V wind components
def compute_wind_components(filtered_data):
    """
    Computes the U and V wind components from wind speed and direction.
    
    Meteorological convention:
    - Wind direction indicates where the wind is coming FROM
    - U is positive when wind blows FROM west TO east (westerly wind)
    - V is positive when wind blows FROM south TO north (southerly wind)
    
    The negative signs in the formulas convert from "direction from which wind is blowing"
    to "direction toward which wind is blowing" (vector convention).
    
    Args:
        filtered_data (dict): Dictionary containing sensor readings
        
    Returns:
        dict: Dictionary with U (east-west) and V (north-south) wind components
    """
    try:
        # Get wind speed and direction from filtered data
        wind_speed = filtered_data.get("Anemometer", 0)  # Wind speed (m/s)
        wind_direction = filtered_data.get("Wind Vane", 0)  # Wind direction (radians)

        # Calculate U component (east-west)
        # Negative sign converts from meteorological to vector convention
        # Positive U = wind blowing eastward
        u_component = -wind_speed * math.sin(wind_direction)
        
        # Calculate V component (north-south)
        # Negative sign converts from meteorological to vector convention
        # Positive V = wind blowing northward
        v_component = -wind_speed * math.cos(wind_direction)

        # Return components rounded to 4 decimal places
        return {"U": round(u_component, 4), "V": round(v_component, 4)}

    except Exception as e:
        print(f"Error computing wind components: {e}")
        # Return zeros if calculation fails
        return {"U": 0, "V": 0}

# Process sensor readings with smoothing
def process_readings(readings, smoothed_values, alpha, send_uv):
    """
    Process raw sensor readings by:
    1. Converting to SI units
    2. Applying exponential smoothing filter
    3. Computing derived values (wind components)
    
    Args:
        readings (list): List of sensor reading dictionaries
        smoothed_values (dict): Dictionary of previously smoothed values (modified in-place)
        alpha (float): Smoothing factor (0-1) - higher values give more weight to new readings
        
    Returns:
        dict: Processed and filtered sensor data with computed values
    """
    filtered_data = {}

    # Process each sensor reading
    for reading in readings:
        sensor_name = reading.get("sensor")
        if sensor_name in REQUIRED_SENSORS:
            try:
                # Convert value to float and apply unit conversion
                value = float(reading.get("value", 0))
                si_value = REQUIRED_SENSORS[sensor_name]["convert"](value)

                # Apply exponential smoothing filter
                # Formula: smoothed = α × new_value + (1-α) × previous_smoothed
                if sensor_name not in smoothed_values:
                    # First reading - use as initial value
                    smoothed_values[sensor_name] = si_value
                else:
                    # Apply smoothing formula
                    smoothed_values[sensor_name] = alpha * si_value + (1 - alpha) * smoothed_values[sensor_name]

                # Store rounded value in output dictionary
                filtered_data[sensor_name] = round(smoothed_values[sensor_name], 5)

            except ValueError:
                print(f"Warning: Could not convert {sensor_name} value '{reading.get('value')}' to float.")

    # Compute and add U, V wind components to the filtered data - If you want to send this data. Uncomment here and add 
    # U V to the stuff in format_output function.
    # These are derived values calculated from wind speed and direction
    if send_uv:
        wind_components = compute_wind_components(filtered_data)
        filtered_data.update(wind_components)

    return filtered_data

# Format the output as "W, Barometer, Thermometer, Anemometer, 10 Minute Wind Gust, Wind Vane, U, V"
def format_output(filtered_data, send_uv):
    """
    Format the processed data into a comma-separated string.
    
    Args:
        filtered_data (dict): Dictionary containing processed sensor readings
        
    Returns:
        str: Formatted string with all sensor values
    """

    if send_uv:
        return "W, {Barometer}, {Thermometer}, {Anemometer}, {10 Minute Wind Gust}, {Wind Vane}, {U}, {V}".format(**filtered_data)
    else:
        return "W, {Barometer}, {Thermometer}, {Anemometer}, {10 Minute Wind Gust}, {Wind Vane}, 0, 0".format(**filtered_data)


# Send the output string via UDP
def send_udp_message(output_string, udp_ip, udp_port):
    """
    Send the formatted data string to a UDP endpoint.
    
    Args:
        output_string (str): The formatted data string
        udp_ip (str): Target IP address
        udp_port (int): Target UDP port
    """
    try:
        # Create UDP socket, send message, and close socket
        sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        sock.sendto(output_string.encode(), (udp_ip, udp_port))
        sock.close()
    except Exception as e:
        print(f"Error sending UDP message: {e}")

# Main execution loop
def main():
    """
    Main program execution loop:
    1. Loads configuration
    2. Sets up HTTP client
    3. Continuously fetches, processes, and sends weather data
    4. Implements connection monitoring and recovery
    """
    # Load configuration parameters
    config = load_config()

    # Extract config values
    api_key = config["api_key"]                     # API authentication key
    station = config["station"]                     # Weather station ID
    alpha = config["alpha"]                         # Smoothing factor (0-1)
    wait_time = config["wait_time"]                 # Time between updates (seconds)
    reset_time = config["reset_time"]               # Connection reset threshold (seconds)
    udp_ip = config["udp_ip"]                       # Target IP for UDP messages
    udp_port = config["udp_port"]                   # Target port for UDP messages
    send_uv_comp = config["send_uv_components"]     # Send UV components

    # Initialize state variables
    smoothed_values = {}                  # Store for smoothing filter state
    http_client = PersistentHTTP()        # Create persistent HTTP connection
    last_success = time.time()            # Track last successful response

    # Main loop - runs indefinitely
    while True:
        # Fetch current weather data
        readings = fetch_weather_data(http_client, api_key, station)

        if readings:
            # Update last successful fetch timestamp
            last_success = time.time()
            
            # Process raw readings into filtered data with computed values
            filtered_data = process_readings(readings, smoothed_values, alpha, send_uv_comp)
            
            # Format data as comma-separated string
            output_string = format_output(filtered_data, send_uv_comp)
            print(output_string)

            # Send formatted data via UDP
            send_udp_message(output_string, udp_ip, udp_port)

        # Check for connection issues
        # If no valid data received for longer than reset_time, reset connection
        if time.time() - last_success > reset_time:
            print("No valid data received for 2 seconds. Resetting connection.")
            http_client.create_opener()

        # Wait before next update
        time.sleep(wait_time)

# Entry point for script execution
if __name__ == "__main__":
    main()