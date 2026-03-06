% This function processes the log files for MRAC_LONG_LAT
function [] = process_mrac_long_lat_log(flightRunNames,baseDir,controller,properties)

    % Assume you are flying both mocap and vio
    der.not_flying_mocap = false;
    der.not_flying_vio = false;

    % Traverse the length of the flight runs and get the data
    for ii = 1:length(flightRunNames)
        log_file_path = fullfile(baseDir, flightRunNames{ii}, controller, 'controller_log.log');
        gains_file_path = fullfile(baseDir,flightRunNames{ii}, controller, 'params', 'gains_MRAC_LONG_LAT.json');
        mocap_file_path = fullfile(baseDir,flightRunNames{ii},'mocap_log.log');
        vio_file_path = fullfile(baseDir,flightRunNames{ii},'vio_log.log');
        
        % Check if the log file exists
        if exist(log_file_path, 'file') ~= 2
            warning('Log file does not exist: %s', log_file_path);
            continue; % Skip to the next flight run
        end

        % Check if the Gains file exits
        if exist(gains_file_path, 'file') ~=2
            warning('Gains file does not exist: %s', gains_file_path);
            continue; % Skip to the next flight run
        end
        
        % Check if the mocap file exists - if it does not say you arent
        % flying mocap
        if exist(mocap_file_path,'file') ~=2
            % warning('Mocap Log file does not exist: %s', mocap_file_path);
            der.not_flying_mocap = true;
        end

        % Check if the vio file exists - if it does not say you arent
        % flying vio
        if exist(vio_file_path,'file') ~=2
            % warning('VIO Log file does not exist: %s',vio_file_path);
            der.not_flying_vio = true;
        end


        % Read the data from the log file
        data = importdata(log_file_path);

        % Read the JSON file
        GainsData = jsondecode(fileread(gains_file_path));

        % If you are flying mocap
        if (~der.not_flying_mocap)
            % Read the mocap file
            MocapData = importdata(mocap_file_path);
        end

        % If you are flying vio
        if (~der.not_flying_vio)
            % Read the vio file
            VioData = importdata(vio_file_path);
        end

        % Add data to the log object
        log.Controller_Time_s                        = data.data(:, 1);
        
        log.differentiator.mrad_2l.x_hat.intphi      = data.data(:, 8);
        log.differentiator.mrad_2l.x_hat.inttheta    = data.data(:, 9);
        log.differentiator.mrad_2l.x_hat.intpsi      = data.data(:,10);
        log.differentiator.mrad_2l.x_hat.phi         = data.data(:,11);
        log.differentiator.mrad_2l.x_hat.theta       = data.data(:,12);
        log.differentiator.mrad_2l.x_hat.psi         = data.data(:,13);
        
        log.differentiator.mrad_2l.x_hat_dot.phi     = data.data(:,14);
        log.differentiator.mrad_2l.x_hat_dot.theta   = data.data(:,15);
        log.differentiator.mrad_2l.x_hat_dot.psi     = data.data(:,16);
        log.differentiator.mrad_2l.x_hat_dot.phi_dot = data.data(:,17);
        log.differentiator.mrad_2l.x_hat_dot.theta_dot = data.data(:,18);
        log.differentiator.mrad_2l.x_hat_dot.psi_dot = data.data(:,19);


        % % Preallocate and compute angle derivatives w.r.t. controller time
        % der.Angle_roll_dot_rad_s_matlab  = gradient(log.Angle_roll_rad,  log.Controller_Time_s);
        % der.Angle_pitch_dot_rad_s_matlab = gradient(log.Angle_pitch_rad, log.Controller_Time_s);
        % der.Angle_yaw_dot_rad_s_matlab   = gradient(log.Angle_yaw_rad,   log.Controller_Time_s);
        % 
        % 
        % % Compute the error in the angular rates
        % der.abs_err.angular_rate.real.phi_dot = abs(log.rate_roll_real_rad_s - der.Angle_roll_dot_rad_s_matlab);
        % der.abs_err.angular_rate.real.theta_dot = abs(log.rate_pitch_real_rad_s - der.Angle_pitch_dot_rad_s_matlab);
        % der.abs_err.angular_rate.real.psi_dot = abs(log.rate_yaw_real_rad_s - der.Angle_yaw_dot_rad_s_matlab);
        % 
        % der.abs_err.angular_rate.diff.phi_dot = abs(log.differentiator.mrad_2l.x_hat_dot.phi_dot - der.Angle_roll_dot_rad_s_matlab);
        % der.abs_err.angular_rate.diff.theta_dot = abs(log.differentiator.mrad_2l.x_hat_dot.theta_dot - der.Angle_pitch_dot_rad_s_matlab);
        % der.abs_err.angular_rate.diff.psi_dot = abs(log.differentiator.mrad_2l.x_hat_dot.psi_dot - der.Angle_yaw_dot_rad_s_matlab);
        % 
        % der.differentiator.mrad_2l.error.phi    = log.Angle_roll_rad  - log.differentiator.mrad_2l.x_hat.phi;
        % der.differentiator.mrad_2l.error.theta  = log.Angle_pitch_rad - log.differentiator.mrad_2l.x_hat.theta;
        % der.differentiator.mrad_2l.error.psi    = log.Angle_yaw_rad   - log.differentiator.mrad_2l.x_hat.psi;

        % If you are flying mocap process the data
        if (~der.not_flying_mocap)
            % Get the mocap data
            mocap.Mocap_time_s = MocapData.data(:,1);
            mocap.x = MocapData.data(:,2);
            mocap.y = MocapData.data(:,3);
            mocap.z = MocapData.data(:,4);
            mocap.q0 = MocapData.data(:,5);
            mocap.q1 = MocapData.data(:,6);
            mocap.q2 = MocapData.data(:,7);
            mocap.q3 = MocapData.data(:,8);
            
            % Create a quaternion array
            mocap.quat = quaternion(mocap.q0, ...
                                    mocap.q1, ...
                                    mocap.q2, ...
                                    mocap.q3);
        
            % Specify the sequence for conversion to Euler angles
            mocap.quaternion.sequence = 'ZYX';
        
            % Convert quaternion array to Euler angles
            mocap.quaternion.eulerAnglesFromQuat = quat2eul(mocap.quat, ...
                                                            mocap.quaternion.sequence);
        
            mocap.roll = mocap.quaternion.eulerAnglesFromQuat(:, 3);
            mocap.pitch = mocap.quaternion.eulerAnglesFromQuat(:, 2);
            mocap.yaw = mocap.quaternion.eulerAnglesFromQuat(:, 1);

            % Compute the frequency of sampled data
            mocap.dt = mean(diff(mocap.Mocap_time_s));
            mocap.F = 1/mocap.dt;
        end

        % If you are flying vio process the data
        if (~der.not_flying_vio)
            % Get the vio data
            % Add data to log object
            vio.controller_time_s = VioData.data(:,1);
            
            vio.x = VioData.data(:,2);
            vio.y = VioData.data(:,3);
            vio.z = VioData.data(:,4);
            
            vio.vx = VioData.data(:,5);
            vio.vy = VioData.data(:,6);
            vio.vz = VioData.data(:,7);
            
            vio.ax = VioData.data(:,8);
            vio.ay = VioData.data(:,9);
            vio.az = VioData.data(:,10);
            
            vio.q0 = VioData.data(:,11);
            vio.q1 = VioData.data(:,12);
            vio.q2 = VioData.data(:,13);
            vio.q3 = VioData.data(:,14);
            
            % Process the quaternion
            % Create a quaternion array
            vio.quat = quaternion(vio.q0, vio.q1, vio.q2, vio.q3);
            
            % Specify the sequence for conversion to Euler angles
            vio.quaternion.sequence = 'ZYX';
            
            % Convert quaternion array to Euler angles
            vio.quaternion.eulerAnglesFromQuat = quat2eul(vio.quat, ...
                                                          vio.quaternion.sequence);
            
            vio.roll = vio.quaternion.eulerAnglesFromQuat(:,3);
            vio.pitch = vio.quaternion.eulerAnglesFromQuat(:,2);
            vio.yaw = vio.quaternion.eulerAnglesFromQuat(:,1);
            
            vio.rollspeed = VioData.data(:,15);
            vio.pitchspeed = VioData.data(:,16);
            vio.yawspeed = VioData.data(:,17);
            
            vio.rollacceleration = VioData.data(:,18);
            vio.pitchacceleration = VioData.data(:,19);
            vio.yawacceleration = VioData.data(:,20);
            
            vio.tracker_conf = VioData.data(:,21);
            vio.mapper_conf = VioData.data(:,22);

            % Compute the frequency of sampled data
            vio.dt = mean(diff(vio.controller_time_s));
            vio.F = 1/vio.dt;
        end
        
        % Define the folder path
        folder_path = fullfile(baseDir, flightRunNames{ii});
        file_name = ['MRAC_LONG_LAT_log_', flightRunNames{ii}, '.mat'];
        full_path = fullfile(folder_path, file_name); % Corrected full_path

        % save the data to the specified file
        if (~der.not_flying_mocap && der.not_flying_vio)
            save(full_path, 'log', 'der',  'mocap');
        elseif(~der.not_flying_vio && der.not_flying_mocap)
            save(full_path, 'log', 'der', 'vio');
            disp('vio saving');
        elseif (~der.not_flying_mocap && ~der.not_flying_vio)
            save(full_path, 'log', 'der',  'mocap', 'vio');
        else
            save(full_path, 'log', 'der');
        end
        
        disp(['Data saved to ', full_path]);

    end

end