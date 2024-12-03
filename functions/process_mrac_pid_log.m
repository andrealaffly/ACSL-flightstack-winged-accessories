% This function processes the log files for MRAC_PID 
function [] = process_mrac_pid_log(flightRunNames,baseDir,controller,MASS,I_q,I_b)
    
    % Assume you are flying both mocap and vio
    der.not_flying_mocap = false;
    der.not_flying_vio = false;

    % Traverse the length of the flight runs and get the data
    for ii = 1:length(flightRunNames)
        log_file_path = fullfile(baseDir, flightRunNames{ii}, controller, 'controller_log.log');
        gains_file_path = fullfile(baseDir,flightRunNames{ii}, controller, 'params', 'gains_MRAC_PID.json');
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
        gains.Kp_tran = GainsData.TRANSLATIONAL.KP_translational.scaling_coef*...
                        GainsData.TRANSLATIONAL.KP_translational.matrix;
        gains.Kd_tran = GainsData.TRANSLATIONAL.KD_translational.scaling_coef*...
                        GainsData.TRANSLATIONAL.KD_translational.matrix;
        gains.Ki_tran = GainsData.TRANSLATIONAL.KI_translational.scaling_coef*...
                        GainsData.TRANSLATIONAL.KI_translational.matrix;
        gains.Kp_rot_q = GainsData.QUADCOPTER.KP_rotational_q.scaling_coef*...
                         GainsData.QUADCOPTER.KP_rotational_q.matrix;
        gains.Kd_rot_q = GainsData.QUADCOPTER.KD_rotational_q.scaling_coef*...
                         GainsData.QUADCOPTER.KD_rotational_q.matrix;
        gains.Ki_rot_q = GainsData.QUADCOPTER.KI_rotational_q.scaling_coef*...
                         GainsData.QUADCOPTER.KI_rotational_q.matrix;
        gains.Kp_rot_b = GainsData.BIPLANE.KP_rotational_b.scaling_coef*...
                         GainsData.BIPLANE.KP_rotational_b.matrix;
        gains.Kd_rot_b = GainsData.BIPLANE.KD_rotational_b.scaling_coef*...
                         GainsData.BIPLANE.KD_rotational_b.matrix;
        gains.Ki_rot_b = GainsData.BIPLANE.KI_rotational_b.scaling_coef*...
                         GainsData.BIPLANE.KI_rotational_b.matrix;
    
        % Add data to log object
        log.Controller_Time_s = data.data(:, 1);    
        log.Alg_exe_time = data.data(:, 2);
        
        log.is_biplane = data.data(:, 3);
        log.momentary_button = data.data(:, 4);

        log.aero.Cl_up = data.data(:, 5);
        log.aero.Cl_lw = data.data(:, 6);
        log.aero.Cl_lt = data.data(:, 7);
        log.aero.Cl_rt = data.data(:, 8);
        log.aero.Cd_up = data.data(:, 9);
        log.aero.Cd_lw = data.data(:, 10);
        log.aero.Cd_lt = data.data(:, 11);
        log.aero.Cd_rt = data.data(:, 12);
        log.aero.Cm_up = data.data(:, 13);
        log.aero.Cm_lw = data.data(:, 14);
        log.aero.Cm_lt = data.data(:, 15);
        log.aero.Cm_rt = data.data(:, 16);

        log.aero.outer_loop_dyn_inv_x = data.data(:, 17);
        log.aero.outer_loop_dyn_inv_y = data.data(:, 18);
        log.aero.outer_loop_dyn_inv_z = data.data(:, 19);
        log.aero.inner_loop_dyn_inv_x = data.data(:, 20);
        log.aero.inner_loop_dyn_inv_y = data.data(:, 21);
        log.aero.inner_loop_dyn_inv_z = data.data(:, 22);

        log.aero.v_norm_sq = data.data(:, 23);

        log.Position_x_m = data.data(:, 24);
        log.Position_y_m = data.data(:, 25);
        log.Position_z_m = data.data(:, 26);
    
        log.Velocity_x_ms = data.data(:, 27);
        log.Velocity_y_ms = data.data(:, 28);
        log.Velocity_z_ms = data.data(:, 29);

        log.Ref_Position_x_m = data.data(:, 30);
        log.Ref_Position_y_m = data.data(:, 31);
        log.Ref_Position_z_m = data.data(:, 32);
    
        log.Ref_Velocity_x_ms = data.data(:, 33);
        log.Ref_Velocity_y_ms = data.data(:, 34);
        log.Ref_Velocity_z_ms = data.data(:, 35);

        log.Ref_Acceleration_x_ms2 = data.data(:, 36);
        log.Ref_Acceleration_y_ms2 = data.data(:, 37);
        log.Ref_Acceleration_z_ms2 = data.data(:, 38);

        log.User_Position_x_m = data.data(:, 39);
        log.User_Position_y_m = data.data(:, 40);
        log.User_Position_z_m = data.data(:, 41);
    
        log.User_Velocity_x_ms = data.data(:, 42);
        log.User_Velocity_y_ms = data.data(:, 43);
        log.User_Velocity_z_ms = data.data(:, 44);

        log.User_Acceleration_x_ms2 = data.data(:, 45);
        log.User_Acceleration_y_ms2 = data.data(:, 46);
        log.User_Acceleration_z_ms2 = data.data(:, 47);

        log.Error_in_position_x_m = data.data(:, 48);
        log.Error_in_position_y_m = data.data(:, 49);
        log.Error_in_position_z_m = data.data(:, 50);

        log.Error_in_velocity_x_ms = data.data(:, 51);
        log.Error_in_velocity_y_ms = data.data(:, 52);
        log.Error_in_velocity_z_ms = data.data(:, 53);

        log.Integral_Error_in_x_m = data.data(:, 54);
        log.Integral_Error_in_y_m = data.data(:, 55);
        log.Integral_Error_in_z_m = data.data(:, 56);

        log.Reference_Error_in_position_x_m = data.data(:, 57);
        log.Reference_Error_in_position_y_m = data.data(:, 58);
        log.Reference_Error_in_position_z_m = data.data(:, 59);

        log.Integral_Reference_Error_in_position_x_m = data.data(:, 60);
        log.Integral_Reference_Error_in_position_y_m = data.data(:, 61);
        log.Integral_Reference_Error_in_position_z_m = data.data(:, 62);

        log.r_cmd_in_position_x = data.data(:, 63);
        log.r_cmd_in_position_y = data.data(:, 64);
        log.r_cmd_in_position_z = data.data(:, 65);

        log.mu_tran_baseline_x = data.data(:, 66);
        log.mu_tran_baseline_y = data.data(:, 67);
        log.mu_tran_baseline_z = data.data(:, 68);

        log.mu_tran_adaptive_x = data.data(:, 69);
        log.mu_tran_adaptive_y = data.data(:, 70);
        log.mu_tran_adaptive_z = data.data(:, 71);
        
        % Calculate the total control input in the outer loop in I
        der.mu_tran_x = log.mu_tran_baseline_x + log.mu_tran_adaptive_x;
        der.mu_tran_y = log.mu_tran_baseline_y + log.mu_tran_adaptive_y;
        der.mu_tran_z = log.mu_tran_baseline_z + log.mu_tran_adaptive_z;

        log.mu_tran_J_x = data.data(:, 72);
        log.mu_tran_J_y = data.data(:, 73);
        log.mu_tran_J_z = data.data(:, 74);

        log.Desired_phi_rad = data.data(:, 75);
        log.Desired_theta_rad = data.data(:, 76);
        log.Desired_psi_rad = data.data(:, 77);

        log.Desired_phi_dot_rads = data.data(:, 78);
        log.Desired_theta_dot_rads = data.data(:, 79);
        log.Desired_psi_dot_rads = data.data(:, 80);
    
        log.Angle_roll_rad = data.data(:, 81);
        log.Angle_pitch_rad = data.data(:, 82);
        log.Angle_yaw_rad = data.data(:, 83);

        log.Angle_roll_rad_q = data.data(:, 84);
        log.Angle_pitch_rad_q = data.data(:, 85);
        log.Angle_yaw_rad_q = data.data(:, 86);

        log.Angle_roll_rad_b = data.data(:, 87);
        log.Angle_pitch_rad_b = data.data(:, 88);
        log.Angle_yaw_rad_b = data.data(:, 89);
    
        log.Angular_rates_x_rads = data.data(:, 90);
        log.Angular_rates_y_rads = data.data(:, 91);
        log.Angular_rates_z_rads = data.data(:, 92);
    
        log.Error_in_Euler_phi_rad = data.data(:, 93);
        log.Error_in_Euler_theta_rad = data.data(:, 94);
        log.Error_in_Euler_psi_rad = data.data(:, 95);    
        
        log.Integral_Error_in_phi_rads = data.data(:, 96);
        log.Integral_Error_in_theta_rads = data.data(:, 97);
        log.Integral_Error_in_psi_rads = data.data(:, 98);
        
        log.Error_in_Euler_phi_rate_rads = data.data(:, 99);
        log.Error_in_Euler_theta_rate_rads = data.data(:, 100);
        log.Error_in_Euler_psi_rate_rads = data.data(:, 101);
        
        log.omega_cmd_rot_x = data.data(:, 102);
        log.omega_cmd_rot_y = data.data(:, 103);
        log.omega_cmd_rot_z = data.data(:, 104);   
    
        log.Reference_Error_omega_x = data.data(:, 105);
        log.Reference_Error_omega_y = data.data(:, 106);
        log.Reference_Error_omega_z = data.data(:, 107);
        
        log.Integral_Reference_Error_omega_x = data.data(:, 108);
        log.Integral_Reference_Error_omega_y = data.data(:, 109);
        log.Integral_Reference_Error_omega_z = data.data(:, 110);

        log.Omega_ref_x = data.data(:, 111);
        log.Omega_ref_y = data.data(:, 112);
        log.Omega_ref_z = data.data(:, 113);

        log.Omega_ref_dot_x = data.data(:, 114);
        log.Omega_ref_dot_y = data.data(:, 115);
        log.Omega_ref_dot_z = data.data(:, 116);

        log.Omega_x = data.data(:, 117);
        log.Omega_y = data.data(:, 118);
        log.Omega_z = data.data(:, 119);
    
        log.Tau_baseline_x = data.data(:, 120);
        log.Tau_baseline_y = data.data(:, 121);
        log.Tau_baseline_z = data.data(:, 122);
    
        log.Tau_adaptive_x = data.data(:, 123);
        log.Tau_adaptive_y = data.data(:, 124);
        log.Tau_adaptive_z = data.data(:, 125);
    
        log.Control_input_u1_N = data.data(:, 126);
        log.Control_input_u2_Nm = data.data(:, 127);
        log.Control_input_u3_Nm = data.data(:, 128);
        log.Control_input_u4_Nm = data.data(:, 129);
    
        log.Thrust_Motor_1_N = data.data(:, 130);
        log.Thrust_Motor_2_N = data.data(:, 131);
        log.Thrust_Motor_3_N = data.data(:, 132);
        log.Thrust_Motor_4_N = data.data(:, 133);
    
        log.Thrust_Motor_1_Normalized_N = data.data(:, 134);
        log.Thrust_Motor_2_Normalized_N = data.data(:, 135);
        log.Thrust_Motor_3_Normalized_N = data.data(:, 136);
        log.Thrust_Motor_4_Normalized_N = data.data(:, 137);   

        log.e_omega_x = data.data(:, 138);
        log.e_omega_y = data.data(:, 139);
        log.e_omega_z = data.data(:, 140);

        % Derived funtion for the quadbiplane angle
        for count = 1:length(log.Controller_Time_s) 
            % if (log.Angle_roll_rad_b(count,:) > pi/2)
            %     der.phi_B(count, 1) = log.Angle_roll_rad_b(count,:) - pi;
            % elseif (log.Angle_roll_rad_b(count,:) < -pi/2)
            %     der.phi_B(count, 1) = log.Angle_roll_rad_b(count, :) + pi;
            % else
            %     der.phi_B(count,1) = log.Angle_roll_rad_b(count, :);
            % end

            der.phi_B(count,1) = -log.Angle_yaw_rad_q(count,:);
            der.theta_B(count,1) = log.Angle_pitch_rad_q(count,:) + pi/2;
            der.psi_B(count,1) = log.Angle_roll_rad_q(count,:);

            % if (log.Angle_yaw_rad_b(count,:) > pi/2)
            %     der.psi_B(count, 1) = log.Angle_yaw_rad_b(count,:) - pi;
            % elseif (log.Angle_yaw_rad_b(count,:) < -pi/2)
            %     der.psi_B(count, 1) = log.Angle_yaw_rad_b(count, :) + pi;
            % else
            %     der.psi_B(count,1) = log.Angle_yaw_rad_b(count, :);
            % end
            
            if (log.is_biplane(count))
                gains.Kp_rot = gains.Kp_rot_b;
                gains.Ki_rot = gains.Ki_rot_b;
                gains.Kd_rot = gains.Kd_rot_b;
            else
                gains.Kp_rot = gains.Kp_rot_q;
                gains.Ki_rot = gains.Ki_rot_q;
                gains.Kd_rot = gains.Kd_rot_q;
            end

            % Gains contribution
            der.Kp_tran_contrib(:,count) = -MASS*gains.Kp_tran*...
                                   [log.Error_in_position_x_m(count,:), ...
                                    log.Error_in_position_y_m(count,:),...
                                    log.Error_in_position_z_m(count,:)]';
    
            der.Kd_tran_contrib(:,count) = -MASS*gains.Kd_tran*...
                                   [log.Error_in_velocity_x_ms(count,:), ...
                                    log.Error_in_velocity_y_ms(count,:), ...
                                    log.Error_in_velocity_z_ms(count,:)]';
    
            der.Ki_tran_contrib(:,count) = -MASS*gains.Ki_tran*...
                                   [log.Integral_Error_in_x_m(count,:), ...
                                    log.Integral_Error_in_y_m(count,:), ...
                                    log.Integral_Error_in_z_m(count,:)]';
    
            der.Tran_baseline_Total(:,count) = (der.Kp_tran_contrib(:,count) + ...
                                       der.Kp_tran_contrib(:,count) + ...
                                       der.Kp_tran_contrib(:,count));
    
            der.Kp_rot_contrib(:,count) = -I_q*gains.Kp_rot*...
                                  [log.Error_in_Euler_phi_rad(count,:), ...
                                   log.Error_in_Euler_theta_rad(count,:),...
                                   log.Error_in_Euler_psi_rad(count,:)]';
    
            der.Kd_rot_contrib(:,count) = -I_q*gains.Kd_rot*...
                                  [log.Error_in_Euler_phi_rate_rads(count,:), ...
                                   log.Error_in_Euler_theta_rate_rads(count,:), ...
                                   log.Error_in_Euler_psi_rate_rads(count,:)]';
    
            der.Ki_rot_contrib(:,count) = -I_q*gains.Ki_rot*...
                                  [log.Integral_Error_in_phi_rads(count,:), ...
                                   log.Integral_Error_in_theta_rads(count,:), ...
                                   log.Integral_Error_in_psi_rads(count,:)]';
    
            der.Rot_baseline_Total(:,count) = (der.Kp_rot_contrib(:,count) + ...
                                      der.Kd_rot_contrib(:,count) + ...
                                      der.Ki_rot_contrib(:,count));
        end

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
        file_name = ['MRAC_PID_log_', flightRunNames{ii}, '.mat'];
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