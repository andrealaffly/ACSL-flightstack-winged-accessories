% This function processes the log files for MRAC_GEOMETRIC
function [] = process_mrac_geometric_log(flightRunNames,baseDir,controller,properties)
    
    % Assume you are flying both mocap and vio
    der.not_flying_mocap = false;
    der.not_flying_vio = false;

    % Traverse the length of the flight runs and get the data    
    for ii = 1:length(flightRunNames)
        log_file_path = fullfile(baseDir, flightRunNames{ii}, controller, 'controller_log.log');
        gains_file_path = fullfile(baseDir,flightRunNames{ii}, controller, 'params', 'gains_MRAC_GEOMETRIC.json');
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
        gains.Kp_tran = GainsData.TRANSLATIONAL.KP_translational.scaling_coef * ...
                        GainsData.TRANSLATIONAL.KP_translational.matrix;
        gains.Kd_tran = GainsData.TRANSLATIONAL.KD_translational.scaling_coef * ...
                        GainsData.TRANSLATIONAL.KD_translational.matrix;
        gains.Ki_tran = GainsData.TRANSLATIONAL.KI_translational.scaling_coef * ...
                        GainsData.TRANSLATIONAL.KI_translational.matrix;
        gains.Kp_att = GainsData.ROTATIONAL.KP_rotational.scaling_coef * ...
                        GainsData.ROTATIONAL.KP_rotational.matrix;
        gains.Kd_att = GainsData.ROTATIONAL.KD_rotational.scaling_coef * ...
                        GainsData.ROTATIONAL.KD_rotational.matrix;
    
        % Add data to log object
        index = 1;
        log.Controller_Time_s = data.data(:, index);     index = index + 1;
        log.Alg_exe_time = data.data(:,index);           index = index + 1;

        log.x_m = data.data(:,index);                    index = index + 1;
        log.y_m = data.data(:,index);                    index = index + 1;
        log.z_m = data.data(:,index);                    index = index + 1;

        log.vx_ms = data.data(:,index);                  index = index + 1;
        log.vy_ms = data.data(:,index);                  index = index + 1;
        log.vz_ms = data.data(:,index);                  index = index + 1;

        log.x_ref = data.data(:,index);                  index = index + 1;
        log.y_ref = data.data(:,index);                  index = index + 1;
        log.z_ref = data.data(:,index);                  index = index + 1;
        
        log.vx_ref = data.data(:,index);                 index = index + 1;
        log.vy_ref = data.data(:,index);                 index = index + 1;
        log.vz_ref = data.data(:,index);                 index = index + 1;
        
        log.ax_ref = data.data(:,index);                 index = index + 1;
        log.ay_ref = data.data(:,index);                 index = index + 1;
        log.az_ref = data.data(:,index);                 index = index + 1;

        log.x_user = data.data(:,index);                 index = index + 1;
        log.y_user = data.data(:,index);                 index = index + 1;
        log.z_user = data.data(:,index);                 index = index + 1;

        log.vx_user = data.data(:,index);                index = index + 1;
        log.vy_user = data.data(:,index);                index = index + 1;
        log.vz_user = data.data(:,index);                index = index + 1;

        log.ax_user = data.data(:,index);                index = index + 1;
        log.ay_user = data.data(:,index);                index = index + 1;
        log.az_user = data.data(:,index);                index = index + 1;

        log.e_x = data.data(:,index);                    index = index + 1;
        log.e_y = data.data(:,index);                    index = index + 1;
        log.e_z = data.data(:,index);                    index = index + 1;

        log.e_vx = data.data(:,index);                   index = index + 1;
        log.e_vy = data.data(:,index);                   index = index + 1;
        log.e_vz = data.data(:,index);                   index = index + 1;

        log.e_x_int = data.data(:,index);                index = index + 1;
        log.e_y_int = data.data(:,index);                index = index + 1;
        log.e_z_int = data.data(:,index);                index = index + 1;
        
        log.e_x_ref = data.data(:,index);                index = index + 1;
        log.e_y_ref = data.data(:,index);                index = index + 1;
        log.e_z_ref = data.data(:,index);                index = index + 1;

        log.e_x_ref_int = data.data(:,index);            index = index + 1;
        log.e_y_ref_int = data.data(:,index);            index = index + 1;
        log.e_z_ref_int = data.data(:,index);            index = index + 1;

        log.x_ref_cmd = data.data(:,index);              index = index + 1;
        log.y_ref_cmd = data.data(:,index);              index = index + 1;
        log.z_ref_cmd = data.data(:,index);              index = index + 1;
        
        log.mu_x_baseline = data.data(:,index);          index = index + 1;
        log.mu_y_baseline = data.data(:,index);          index = index + 1;
        log.mu_z_baseline = data.data(:,index);          index = index + 1;

        log.mu_x_adaptive = data.data(:,index);          index = index + 1;
        log.mu_y_adaptive = data.data(:,index);          index = index + 1;
        log.mu_z_adaptive = data.data(:,index);          index = index + 1;
        
        log.mu_x_I = data.data(:,index);                 index = index + 1;
        log.mu_y_I = data.data(:,index);                 index = index + 1;
        log.mu_z_I = data.data(:,index);                 index = index + 1;

        log.omega_d_x = data.data(:,index);              index = index + 1;
        log.omega_d_y = data.data(:,index);              index = index + 1;
        log.omega_d_z = data.data(:,index);              index = index + 1;

        log.alpha_d_x = data.data(:,index);              index = index + 1;
        log.alpha_d_y = data.data(:,index);              index = index + 1;
        log.alpha_d_z = data.data(:,index);              index = index + 1;
        
        log.omega_x = data.data(:,index);                index = index + 1;
        log.omega_y = data.data(:,index);                index = index + 1;
        log.omega_z = data.data(:,index);                index = index + 1;

        log.omega_x_cmd = data.data(:,index);            index = index + 1;
        log.omega_y_cmd = data.data(:,index);            index = index + 1;
        log.omega_z_cmd = data.data(:,index);            index = index + 1;

        log.omega_x_ref = data.data(:,index);            index = index + 1;
        log.omega_y_ref = data.data(:,index);            index = index + 1;
        log.omega_z_ref = data.data(:,index);            index = index + 1;

        log.alpha_x_ref = data.data(:,index);            index = index + 1;
        log.alpha_y_ref = data.data(:,index);            index = index + 1;
        log.alpha_z_ref = data.data(:,index);            index = index + 1;

        log.omega_ref_e_x = data.data(:,index);          index = index + 1;
        log.omega_ref_e_y = data.data(:,index);          index = index + 1;
        log.omega_ref_e_z = data.data(:,index);          index = index + 1;

        log.Xi_e_x = data.data(:,index);                 index = index + 1;
        log.Xi_e_y = data.data(:,index);                 index = index + 1;
        log.Xi_e_z = data.data(:,index);                 index = index + 1;
        
        log.omega_e_x = data.data(:,index);              index = index + 1;
        log.omega_e_y = data.data(:,index);              index = index + 1;
        log.omega_e_z = data.data(:,index);              index = index + 1;

        log.omega_ref_e_x_I = data.data(:,index);        index = index + 1;
        log.omega_ref_e_y_I = data.data(:,index);        index = index + 1;
        log.omega_ref_e_z_I = data.data(:,index);        index = index + 1;

        log.tau_x_baseline = data.data(:,index);         index = index + 1;
        log.tau_y_baseline = data.data(:,index);         index = index + 1;
        log.tau_z_baseline = data.data(:,index);         index = index + 1;

        log.tau_x_adaptive = data.data(:,index);         index = index + 1;
        log.tau_y_adaptive = data.data(:,index);         index = index + 1;
        log.tau_z_adaptive = data.data(:,index);         index = index + 1;

        log.u_1 = data.data(:,index);                    index = index + 1;
        log.u_2 = data.data(:,index);                    index = index + 1;
        log.u_3 = data.data(:,index);                    index = index + 1;
        log.u_4 = data.data(:,index);                    index = index + 1;

        log.Motor_1_Thrust_N = data.data(:,index);       index = index + 1;
        log.Motor_2_Thrust_N = data.data(:,index);       index = index + 1;
        log.Motor_3_Thrust_N = data.data(:,index);       index = index + 1;
        log.Motor_4_Thrust_N = data.data(:,index);       index = index + 1;

        log.Motor_1_Thr_Sat_Norm = data.data(:,index);   index = index + 1;
        log.Motor_2_Thr_Sat_Norm = data.data(:,index);   index = index + 1;
        log.Motor_3_Thr_Sat_Norm = data.data(:,index);   index = index + 1;
        log.Motor_4_Thr_Sat_Norm = data.data(:,index);   index = index + 1; 

        log.dead_zone_value_tran = data.data(:,index);    index = index + 1;
        log.dead_zone_value_rot = data.data(:,index);     index = index + 1;

        log.proj_activated_K_hat_x_tran = data.data(:,index);
                                                          index = index + 1;
        log.proj_activated_K_hat_r_tran = data.data(:,index);
                                                          index = index + 1;
        log.proj_activated_Theta_hat_tran = data.data(:,index);
                                                          index = index + 1;
        
        log.proj_activated_K_hat_x_rot = data.data(:,index);
                                                          index = index + 1;
        log.proj_activated_K_hat_r_rot = data.data(:,index);
                                                          index = index + 1;
        log.proj_activated_Theta_hat_rot = data.data(:,index);
                                                          index = index + 1;

        % Process the rotation matrices
        log = processGainMatrixLog(log, 'R_d', data, index, 3, 3);
                                                         index = index + 3*3;
        log = processGainMatrixLog(log, 'R_d_dot', data, index, 3, 3);
                                                         index = index + 3*3;
        log = processGainMatrixLog(log, 'R_ji', data, index, 3, 3);
                                                         index = index + 3*3;

        % Process gains data
        log = processGainMatrixLog(log, 'K_hat_x_tran', data, index, 6, 3);
                                                         index = index + 6*3;
        log = processGainMatrixLog(log, 'K_hat_r_tran', data, index, 3, 3);
                                                         index = index + 3*3;
        log = processGainMatrixLog(log, 'Theta_hat_tran', data, index, 30, 3);
                                                         index = index + 30*3;
        
        log = processGainMatrixLog(log, 'K_hat_x_rot', data, index, 3, 3);
                                                         index = index + 3*3;
        log = processGainMatrixLog(log, 'K_hat_r_rot', data, index, 3, 3);
                                                         index = index + 3*3;
        log = processGainMatrixLog(log, 'Theta_hat_rot', data, index, 12, 3);
                                                         index = index + 3*3;
        
        % Average algorithm execution time 
        der.average_algorithm_execution_time_us = ...
            mean(log.Alg_exe_time(log.Alg_exe_time > 0));

        % Standard deviation of algorithm execution time
        der.standard_deviation_algorithm_execution_time_us = ...
            std(log.Alg_exe_time(log.Alg_exe_time > 0));
        
        % Obtain the quaternion from the rotation matrices
        % Convert log.R_d.* (ind0_0, ind0_1, ...) into 3x3xN rotation matrices
        N = numel(log.R_d.ind0_0);
        
        R_d_rotm = zeros(3,3,N);
        R_d_rotm(1,1,:) = log.R_d.ind0_0;
        R_d_rotm(1,2,:) = log.R_d.ind0_1;
        R_d_rotm(1,3,:) = log.R_d.ind0_2;
        
        R_d_rotm(2,1,:) = log.R_d.ind1_0;
        R_d_rotm(2,2,:) = log.R_d.ind1_1;
        R_d_rotm(2,3,:) = log.R_d.ind1_2;
        
        R_d_rotm(3,1,:) = log.R_d.ind2_0;
        R_d_rotm(3,2,:) = log.R_d.ind2_1;
        R_d_rotm(3,3,:) = log.R_d.ind2_2;
        
        % Convert rotation matrices to quaternions, each row: [w x y z]
        der.R_d_quat = rotm2quat(R_d_rotm);

        % Obtain the quaternion from the rotation matrices
        % Convert log.R_ji.* (ind0_0, ind0_1, ...) into 3x3xN rotation matrices
        N = numel(log.R_ji.ind0_0);
        
        R_ji_rotm = zeros(3,3,N);
        R_ji_rotm(1,1,:) = log.R_ji.ind0_0;
        R_ji_rotm(1,2,:) = log.R_ji.ind0_1;
        R_ji_rotm(1,3,:) = log.R_ji.ind0_2;
        
        R_ji_rotm(2,1,:) = log.R_ji.ind1_0;
        R_ji_rotm(2,2,:) = log.R_ji.ind1_1;
        R_ji_rotm(2,3,:) = log.R_ji.ind1_2;
        
        R_ji_rotm(3,1,:) = log.R_ji.ind2_0;
        R_ji_rotm(3,2,:) = log.R_ji.ind2_1;
        R_ji_rotm(3,3,:) = log.R_ji.ind2_2;
        
        % Convert rotation matrices to quaternions, each row: [w x y z]
        der.R_ji_quat = rotm2quat(R_ji_rotm);

        % ----- START OF L2 NORM CALCULATION FOR THE GEOMETRIC CONTROLLER
        t = log.Controller_Time_s;   % N×1
        
        % ---- position error components (N×1 each)
        ex = log.e_x;
        ey = log.e_y;
        ez = log.e_z;
        
        % ---- velocity error components (N×1 each)
        evx = log.e_vx;
        evy = log.e_vy;
        evz = log.e_vz;
        
        % ---- squared magnitude of position and velocity errors (no pointwise norms)
        e_pos_sq = ex.^2 + ey.^2 + ez.^2;
        e_vel_sq = evx.^2 + evy.^2 + evz.^2;
        
        % ---- cumulative integrals: ∫_0^{t_k} ||e(τ)||^2 dτ
        I_pos = cumtrapz(t, e_pos_sq);
        I_vel = cumtrapz(t, e_vel_sq);
        
        % ---- time-series L2 norms: ||e||_{L2}(t_k) = sqrt(∫_0^{t_k} ||e(τ)||^2 dτ)
        der.L2_norm_pos = sqrt(I_pos);
        der.L2_norm_vel = sqrt(I_vel);
        
        % ---- combined 6D error L2 time series
        I_comb = I_pos + I_vel;   % ∫(||e_pos||^2 + ||e_vel||^2)
        der.L2_norm_combined_tran = sqrt(I_comb);

        % ----- END OF L2 NORM CALCULATION FOR THE GEOMETRIC CONTROLLER

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
        file_name = ['MRAC_GEOMETRIC_log_', flightRunNames{ii}, '.mat'];
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