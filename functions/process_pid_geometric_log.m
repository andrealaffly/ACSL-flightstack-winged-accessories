% This function processes the log files for PID_QUATERNION
function [] = process_pid_geometric_log(flightRunNames,baseDir,controller,properties)
    
    % Assume you are flying both mocap and vio
    der.not_flying_mocap = false;
    der.not_flying_vio = false;

    % Traverse the length of the flight runs and get the data    
    for ii = 1:length(flightRunNames)
        log_file_path = fullfile(baseDir, flightRunNames{ii}, controller, 'controller_log.log');
        gains_file_path = fullfile(baseDir,flightRunNames{ii}, controller, 'params', 'gains_PID_GEOMETRIC.json');
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

        % Add data to gains object - not really used here for plotting.
        gains.Kp_tran = GainsData.BASELINE.KP_translational.scaling_coef * ...
                        GainsData.BASELINE.KP_translational.matrix;
        gains.Kd_tran = GainsData.BASELINE.KD_translational.scaling_coef * ...
                        GainsData.BASELINE.KD_translational.matrix;
        gains.Ki_tran = GainsData.BASELINE.KI_translational.scaling_coef * ...
                        GainsData.BASELINE.KI_translational.matrix;
        gains.Kp_att = GainsData.BASELINE.KP_rotational.scaling_coef * ...
                        GainsData.BASELINE.KP_rotational.matrix;
        gains.Kd_att = GainsData.BASELINE.KD_rotational.scaling_coef * ...
                        GainsData.BASELINE.KD_rotational.matrix;
    
        % Add data to log object
        index = 1;
        log.Controller_Time_s = data.data(:, index);     index = index + 1;
        log.Alg_exe_time = data.data(:,index);           index = index + 1;

        log.x_user = data.data(:,index);                 index = index + 1;
        log.y_user = data.data(:,index);                 index = index + 1;
        log.z_user = data.data(:,index);                 index = index + 1;

        log.vx_user = data.data(:,index);                index = index + 1;
        log.vy_user = data.data(:,index);                index = index + 1;
        log.vz_user = data.data(:,index);                index = index + 1;

        log.ax_user = data.data(:,index);                index = index + 1;
        log.ay_user = data.data(:,index);                index = index + 1;
        log.az_user = data.data(:,index);                index = index + 1;

        log.psi_user = data.data(:,index);               index = index + 1;

        log.x_m = data.data(:,index);                    index = index + 1;
        log.y_m = data.data(:,index);                    index = index + 1;
        log.z_m = data.data(:,index);                    index = index + 1;

        log.vx_ms = data.data(:,index);                  index = index + 1;
        log.vy_ms = data.data(:,index);                  index = index + 1;
        log.vz_ms = data.data(:,index);                  index = index + 1;

        log.omega_x = data.data(:,index);                index = index + 1;
        log.omega_y = data.data(:,index);                index = index + 1;
        log.omega_z = data.data(:,index);                index = index + 1;

        log.e_x = data.data(:,index);                    index = index + 1;
        log.e_y = data.data(:,index);                    index = index + 1;
        log.e_z = data.data(:,index);                    index = index + 1;

        log.e_vx = data.data(:,index);                   index = index + 1;
        log.e_vy = data.data(:,index);                   index = index + 1;
        log.e_vz = data.data(:,index);                   index = index + 1;

        log.e_x_int = data.data(:,index);                index = index + 1;
        log.e_y_int = data.data(:,index);                index = index + 1;
        log.e_z_int = data.data(:,index);                index = index + 1;

        log.mu_tran_baseline_x = data.data(:,index);     index = index + 1;
        log.mu_tran_baseline_y = data.data(:,index);     index = index + 1;
        log.mu_tran_baseline_z = data.data(:,index);     index = index + 1;

        log.mu_x_I = data.data(:,index);                 index = index + 1;
        log.mu_y_I = data.data(:,index);                 index = index + 1;
        log.mu_z_I = data.data(:,index);                 index = index + 1;

        log.mu_x_I_dot = data.data(:,index);             index = index + 1;
        log.mu_y_I_dot = data.data(:,index);             index = index + 1;
        log.mu_z_I_dot = data.data(:,index);             index = index + 1;

        log.omega_d_x = data.data(:,index);              index = index + 1;
        log.omega_d_y = data.data(:,index);              index = index + 1;
        log.omega_d_z = data.data(:,index);              index = index + 1;

        log.alpha_d_x = data.data(:,index);              index = index + 1;
        log.alpha_d_y = data.data(:,index);              index = index + 1;
        log.alpha_d_z = data.data(:,index);              index = index + 1;

        log.Xi_e_x = data.data(:,index);                 index = index + 1;
        log.Xi_e_y = data.data(:,index);                 index = index + 1;
        log.Xi_e_z = data.data(:,index);                 index = index + 1;
        
        log.omega_e_x = data.data(:,index);              index = index + 1;
        log.omega_e_y = data.data(:,index);              index = index + 1;
        log.omega_e_z = data.data(:,index);              index = index + 1;

        log.tau_rot_baseline_x = data.data(:,index);     index = index + 1;
        log.tau_rot_baseline_y = data.data(:,index);     index = index + 1;
        log.tau_rot_baseline_z = data.data(:,index);     index = index + 1;

        log.tau_x = data.data(:,index);                  index = index + 1;
        log.tau_y = data.data(:,index);                  index = index + 1;
        log.tau_z = data.data(:,index);                  index = index + 1;

        log.u1 = data.data(:,index);                      index = index + 1;
        log.u2 = data.data(:,index);                      index = index + 1;
        log.u3 = data.data(:,index);                      index = index + 1;
        log.u4 = data.data(:,index);                      index = index + 1;
        
        log.Motor_1_Thrust_N = data.data(:,index);       index = index + 1;
        log.Motor_2_Thrust_N = data.data(:,index);       index = index + 1;
        log.Motor_3_Thrust_N = data.data(:,index);       index = index + 1;
        log.Motor_4_Thrust_N = data.data(:,index);       index = index + 1;

        log.Motor_1_Thr_Sat_Norm = data.data(:,index);   index = index + 1;
        log.Motor_2_Thr_Sat_Norm = data.data(:,index);   index = index + 1;
        log.Motor_3_Thr_Sat_Norm = data.data(:,index);   index = index + 1;
        log.Motor_4_Thr_Sat_Norm = data.data(:,index);   index = index + 1; 

        % log ingestion code for all the rotation matrices


        % Average algorithm execution time 
        der.average_algorithm_execution_time_us = ...
            mean(log.Alg_exe_time(log.Alg_exe_time > 0));

        % Standard deviation of algorithm execution time
        der.standard_deviation_algorithm_execution_time_us = ...
            std(log.Alg_exe_time(log.Alg_exe_time > 0));
        
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
        file_name = ['PID_QUATERNION_log_', flightRunNames{ii}, '.mat'];
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