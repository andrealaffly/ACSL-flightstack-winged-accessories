% This function processes the log files for PID_OMEGA 
function [] = process_pid_omega_log(flightRunNames,baseDir,controller,MASS,I_q)
    
    % Assume you are flying both mocap and vio
    der.not_flying_mocap = false;
    der.not_flying_vio = false;

    % Traverse the length of the flight runs and get the data    
    for ii = 1:length(flightRunNames)
        log_file_path = fullfile(baseDir, flightRunNames{ii}, controller, 'controller_log.log');
        gains_file_path = fullfile(baseDir,flightRunNames{ii}, controller, 'params', 'gains_PID_OMEGA.json');
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

        % Add data to gains object
        gains.Kp_tran = GainsData.BASELINE.KP_translational.scaling_coef * ...
                        GainsData.BASELINE.KP_translational.matrix;
        gains.Kd_tran = GainsData.BASELINE.KD_translational.scaling_coef * ...
                        GainsData.BASELINE.KD_translational.matrix;
        gains.Ki_tran = GainsData.BASELINE.KI_translational.scaling_coef * ...
                        GainsData.BASELINE.KI_translational.matrix;
        gains.Kp_rot = GainsData.BASELINE.KP_rotational.scaling_coef * ...
                        GainsData.BASELINE.KP_rotational.matrix;
        gains.Kd_rot = GainsData.BASELINE.KD_rotational.scaling_coef * ...
                        GainsData.BASELINE.KD_rotational.matrix;
        gains.Ki_rot = GainsData.BASELINE.KI_rotational.scaling_coef * ...
                        GainsData.BASELINE.KI_rotational.matrix;
    
        % Add data to log object
        log.Controller_Time_s = data.data(:, 1);    
        log.Alg_exe_time = data.data(:,2);

        log.Position_x_m = data.data(:, 3);
        log.Position_y_m = data.data(:, 4);
        log.Position_z_m = data.data(:, 5);
    
        log.Velocity_x_ms = data.data(:, 6);
        log.Velocity_y_ms = data.data(:, 7);
        log.Velocity_z_ms = data.data(:, 8);
    
        log.Angle_roll_rad = data.data(:, 9);
        log.Angle_pitch_rad = data.data(:, 10);
        log.Angle_yaw_rad = data.data(:, 11);
    
        log.omega_x_rads = data.data(:, 12);
        log.omega_y_rads = data.data(:, 13);
        log.omega_z_rads = data.data(:, 14);
    
        log.User_Position_x_m = data.data(:, 15);
        log.User_Position_y_m = data.data(:, 16);
        log.User_Position_z_m = data.data(:, 17);
    
        log.User_Velocity_x_ms = data.data(:, 18);
        log.User_Velocity_y_ms = data.data(:, 19);
        log.User_Velocity_z_ms = data.data(:, 20);
    
        log.Desired_phi_rad = data.data(:, 21);
        log.Desired_theta_rad = data.data(:, 22);
        log.Desired_psi_rad = data.data(:, 23);
        
        log.Desired_phi_dot_rads = data.data(:, 24);
        log.Desired_theta_dot_rads = data.data(:, 25);
        log.Desired_psi_dot_rads = data.data(:, 26);

        log.Desired_omega_x_rads = data.data(:, 27);
        log.Desired_omega_y_rads = data.data(:, 28);
        log.Desired_omega_z_rads = data.data(:, 29);

        log.Desired_alpha_x_rads = data.data(:, 30);
        log.Desired_alpha_y_rads = data.data(:, 31);
        log.Desired_alpha_z_rads = data.data(:, 32);
        
        log.Error_in_position_x_m = data.data(:, 33);
        log.Error_in_position_y_m = data.data(:, 34);
        log.Error_in_position_z_m = data.data(:, 35);
        
        log.Integral_Error_in_x_m = data.data(:, 36);
        log.Integral_Error_in_y_m = data.data(:, 37);
        log.Integral_Error_in_z_m = data.data(:, 38);
    
        log.Error_in_velocity_x_ms = data.data(:, 39);
        log.Error_in_velocity_y_ms = data.data(:, 40);
        log.Error_in_velocity_z_ms = data.data(:, 41);
    
        log.Error_in_Euler_phi_rad = data.data(:, 42);
        log.Error_in_Euler_theta_rad = data.data(:, 43);
        log.Error_in_Euler_psi_rad = data.data(:, 44);
        
        log.Integral_Error_in_phi_rads = data.data(:, 45);
        log.Integral_Error_in_theta_rads = data.data(:, 46);
        log.Integral_Error_in_psi_rads = data.data(:, 47);
    
        log.Error_in_omega_x_rads = data.data(:, 48);
        log.Error_in_omega_y_rads = data.data(:, 49);
        log.Error_in_omega_z_rads = data.data(:, 50);
    
        log.Virutal_control_mu_in_I_x_N = data.data(:, 51);
        log.Virutal_control_mu_in_I_y_N = data.data(:, 52);
        log.Virutal_control_mu_in_I_z_N = data.data(:, 53);
    
        log.Virtual_control_in_body_x_N = data.data(:, 54);
        log.Virtual_control_in_body_y_N = data.data(:, 55);
        log.Virtual_control_in_body_z_N = data.data(:, 56);
    
        log.Control_input_u1_N = data.data(:, 57);
        log.Control_input_u2_Nm = data.data(:, 58);
        log.Control_input_u3_Nm = data.data(:, 59);
        log.Control_input_u4_Nm = data.data(:, 60);
    
        log.Thrust_Motor_1_N = data.data(:, 61);
        log.Thrust_Motor_2_N = data.data(:, 62);
        log.Thrust_Motor_3_N = data.data(:, 63);
        log.Thrust_Motor_4_N = data.data(:, 64);
    
        log.Thrust_Motor_1_Normalized_N = data.data(:, 65);
        log.Thrust_Motor_2_Normalized_N = data.data(:, 66);
        log.Thrust_Motor_3_Normalized_N = data.data(:, 67);
        log.Thrust_Motor_4_Normalized_N = data.data(:, 68);   
   
        % Average algorithm execution time 
        der.average_algorithm_execution_time_us = ...
            mean(log.Alg_exe_time(log.Alg_exe_time > 0));

        % Standard deviation of algorithm execution time
        der.standard_deviation_algorithm_execution_time_us = ...
            std(log.Alg_exe_time(log.Alg_exe_time > 0));

        % Gains contribution
        der.Kp_tran_contrib = -MASS*gains.Kp_tran*...
                               [log.Error_in_position_x_m, ...
                                log.Error_in_position_y_m,...
                                log.Error_in_position_z_m]';

        der.Kd_tran_contrib = -MASS*gains.Kd_tran*...
                               [log.Error_in_velocity_x_ms, ...
                                log.Error_in_velocity_y_ms, ...
                                log.Error_in_velocity_z_ms]';

        der.Ki_tran_contrib = -MASS*gains.Ki_tran*...
                               [log.Integral_Error_in_x_m, ...
                                log.Integral_Error_in_y_m, ...
                                log.Integral_Error_in_z_m]';

        der.Tran_baseline_Total = (der.Kp_tran_contrib + ...
                                   der.Kp_tran_contrib + ...
                                   der.Kp_tran_contrib);

        der.Kp_rot_contrib = -I_q*gains.Kp_rot*...
                              [log.Error_in_Euler_phi_rad, ...
                               log.Error_in_Euler_theta_rad,...
                               log.Error_in_Euler_psi_rad]';

        der.Kd_rot_contrib = -I_q*gains.Kd_rot*...
                              [log.Error_in_omega_x_rads, ...
                               log.Error_in_omega_y_rads, ...
                               log.Error_in_omega_z_rads]';

        der.Ki_rot_contrib = -I_q*gains.Ki_rot*...
                              [log.Integral_Error_in_phi_rads, ...
                               log.Integral_Error_in_theta_rads, ...
                               log.Integral_Error_in_psi_rads]';

        der.Rot_baseline_Total = (der.Kp_rot_contrib + ...
                                  der.Kd_rot_contrib + ...
                                  der.Ki_rot_contrib);

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
        file_name = ['PID_OMEGA_log_', flightRunNames{ii}, '.mat'];
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