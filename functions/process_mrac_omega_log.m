% This function processes the log files for MRAC_OMEGA
function [] = process_mrac_omega_log(flightRunNames,baseDir,controller,MASS,I_q)

    % Assumer you are flying both mocap and vio
    der.not_flying_mocap = false;
    der.not_flying_vio = false;

    % Traverse the length of the flight runs and get the data
    for ii = 1:length(flightRunNames)
        log_file_path = fullfile(baseDir, flightRunNames{ii}, controller, 'controller_log.log');
        gains_file_path = fullfile(baseDir,flightRunNames{ii}, controller, 'params', 'gains_MRAC_OMEGA.json');
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
        gains.Kp_tran = GainsData.TRANSLATIONAL.KP_translational.scaling_coef * ...
                        GainsData.TRANSLATIONAL.KP_translational.matrix;
        gains.Ki_tran = GainsData.TRANSLATIONAL.KI_translational.scaling_coef * ...
                        GainsData.TRANSLATIONAL.KI_translational.matrix;
        gains.Kd_tran = GainsData.TRANSLATIONAL.KD_translational.scaling_coef * ...
                        GainsData.TRANSLATIONAL.KD_translational.matrix;
        gains.Kp_rot = GainsData.ROTATIONAL.KP_rotational.scaling_coef * ...
                        GainsData.ROTATIONAL.KP_rotational.matrix;
        gains.Ki_rot = GainsData.ROTATIONAL.KI_rotational.scaling_coef * ...
                        GainsData.ROTATIONAL.KI_rotational.matrix;
        gains.Kd_rot = GainsData.ROTATIONAL.KD_rotational.scaling_coef * ...
                        GainsData.ROTATIONAL.KD_rotational.matrix;
    
        % Add the projection operator data
        % Outer loop
        gains.outer_loop.projection_operator.x_max.x = GainsData.ROBUSTIFICATION.projection_x_max_x_translational;
        gains.outer_loop.projection_operator.epsilon.x = GainsData.ROBUSTIFICATION.projection_epsilon_x_translational;

        gains.outer_loop.projection_operator.x_max.r = GainsData.ROBUSTIFICATION.projection_x_max_r_translational;
        gains.outer_loop.projection_operator.epsilon.r = GainsData.ROBUSTIFICATION.projection_epsilon_r_translational;

        gains.outer_loop.projection_operator.x_max.Theta = GainsData.ROBUSTIFICATION.projection_x_max_Theta_translational;
        gains.outer_loop.projection_operator.epsilon.Theta = GainsData.ROBUSTIFICATION.projection_epsilon_Theta_translational;

        % Inner loop
        gains.inner_loop.projection_operator.x_max.x = GainsData.ROBUSTIFICATION.projection_x_max_x_rotational;
        gains.inner_loop.projection_operator.epsilon.x = GainsData.ROBUSTIFICATION.projection_epsilon_x_rotational;

        gains.inner_loop.projection_operator.x_max.r = GainsData.ROBUSTIFICATION.projection_x_max_r_rotational;
        gains.inner_loop.projection_operator.epsilon.r = GainsData.ROBUSTIFICATION.projection_epsilon_r_rotational;

        gains.inner_loop.projection_operator.x_max.Theta = GainsData.ROBUSTIFICATION.projection_x_max_Theta_rotational;
        gains.inner_loop.projection_operator.epsilon.Theta = GainsData.ROBUSTIFICATION.projection_epsilon_Theta_rotational;



        % Add data to the log object
        log.Controller_Time_s = data.data(:,1);
        log.Alg_exe_time = data.data(:,2);

        log.aero.Cl_up = data.data(:, 3);
        log.aero.Cl_lw = data.data(:, 4);
        log.aero.Cl_lt = data.data(:, 5);
        log.aero.Cl_rt = data.data(:, 6);
        log.aero.Cd_up = data.data(:, 7);
        log.aero.Cd_lw = data.data(:, 8);
        log.aero.Cd_lt = data.data(:, 9);
        log.aero.Cd_rt = data.data(:, 10);
        log.aero.Cm_up = data.data(:, 11);
        log.aero.Cm_lw = data.data(:, 12);
        log.aero.Cm_lt = data.data(:, 13);
        log.aero.Cm_rt = data.data(:, 14);

        log.aero.v_norm_sq = data.data(:, 15);

        log.aero.alpha = data.data(:,16);
        log.aero.alpha_up = data.data(:,17);
        log.aero.alpha_lw = data.data(:,18);
        log.aero.beta = data.data(:,19);
        log.aero.beta_lt = data.data(:,20);
        log.aero.beta_rt = data.data(:,21);
        log.aero.F_x = data.data(:,22);
        log.aero.F_y = data.data(:,23);
        log.aero.F_z = data.data(:,24);
        log.aero.M_x = data.data(:,25);
        log.aero.M_y = data.data(:,26);
        log.aero.M_z = data.data(:,27);

        log.aero.outer_loop_dyn_inv_x = data.data(:, 28);
        log.aero.outer_loop_dyn_inv_y = data.data(:, 29);
        log.aero.outer_loop_dyn_inv_z = data.data(:, 30);
        log.aero.inner_loop_dyn_inv_x = data.data(:, 31);
        log.aero.inner_loop_dyn_inv_y = data.data(:, 32);
        log.aero.inner_loop_dyn_inv_z = data.data(:, 33);

        log.Position_x_m = data.data(:, 34);
        log.Position_y_m = data.data(:, 35);
        log.Position_z_m = data.data(:, 36);
    
        log.Velocity_x_ms = data.data(:, 37);
        log.Velocity_y_ms = data.data(:, 38);
        log.Velocity_z_ms = data.data(:, 39);

        log.Ref_Position_x_m = data.data(:, 40);
        log.Ref_Position_y_m = data.data(:, 41);
        log.Ref_Position_z_m = data.data(:, 42);
    
        log.Ref_Velocity_x_ms = data.data(:, 43);
        log.Ref_Velocity_y_ms = data.data(:, 44);
        log.Ref_Velocity_z_ms = data.data(:, 45);

        log.Ref_Acceleration_x_ms2 = data.data(:, 46);
        log.Ref_Acceleration_y_ms2 = data.data(:, 47);
        log.Ref_Acceleration_z_ms2 = data.data(:, 48);

        log.User_Position_x_m = data.data(:, 49);
        log.User_Position_y_m = data.data(:, 50);
        log.User_Position_z_m = data.data(:, 51);
    
        log.User_Velocity_x_ms = data.data(:, 52);
        log.User_Velocity_y_ms = data.data(:, 53);
        log.User_Velocity_z_ms = data.data(:, 54);

        log.User_Acceleration_x_ms2 = data.data(:, 55);
        log.User_Acceleration_y_ms2 = data.data(:, 56);
        log.User_Acceleration_z_ms2 = data.data(:, 57);

        log.Error_in_position_x_m = data.data(:, 58);
        log.Error_in_position_y_m = data.data(:, 59);
        log.Error_in_position_z_m = data.data(:, 60);

        log.Error_in_velocity_x_ms = data.data(:, 61);
        log.Error_in_velocity_y_ms = data.data(:, 62);
        log.Error_in_velocity_z_ms = data.data(:, 63);

        log.Integral_Error_in_x_m = data.data(:, 64);
        log.Integral_Error_in_y_m = data.data(:, 65);
        log.Integral_Error_in_z_m = data.data(:, 66);

        log.Reference_Error_in_position_x_m = data.data(:, 67);
        log.Reference_Error_in_position_y_m = data.data(:, 68);
        log.Reference_Error_in_position_z_m = data.data(:, 69);

        log.Integral_Reference_Error_in_position_x_m = data.data(:, 70);
        log.Integral_Reference_Error_in_position_y_m = data.data(:, 71);
        log.Integral_Reference_Error_in_position_z_m = data.data(:, 72);

        log.r_cmd_in_position_x = data.data(:, 73);
        log.r_cmd_in_position_y = data.data(:, 74);
        log.r_cmd_in_position_z = data.data(:, 75);

        log.mu_tran_baseline_x = data.data(:, 76);
        log.mu_tran_baseline_y = data.data(:, 77);
        log.mu_tran_baseline_z = data.data(:, 78);

        log.mu_tran_adaptive_x = data.data(:, 79);
        log.mu_tran_adaptive_y = data.data(:, 80);
        log.mu_tran_adaptive_z = data.data(:, 81);

        % Calculate the total control input in the outer loop in I
        log.Virutal_control_mu_in_I_x_N = log.mu_tran_baseline_x + log.mu_tran_adaptive_x;
        log.Virutal_control_mu_in_I_y_N = log.mu_tran_baseline_y + log.mu_tran_adaptive_y;
        log.Virutal_control_mu_in_I_z_N = log.mu_tran_baseline_z + log.mu_tran_adaptive_z;

        log.Virtual_control_in_body_x_N = data.data(:, 82);
        log.Virtual_control_in_body_y_N = data.data(:, 83);
        log.Virtual_control_in_body_z_N = data.data(:, 84);

        log.Desired_phi_rad = data.data(:, 85);
        log.Desired_theta_rad = data.data(:, 86);
        log.Desired_psi_rad = data.data(:, 87);

        log.Desired_wx_rads = data.data(:, 88);
        log.Desired_wy_rads = data.data(:, 89);
        log.Desired_wz_rads = data.data(:, 90);

        log.Desired_alpha_x_rads2 = data.data(:, 91);
        log.Desired_alpha_y_rads2 = data.data(:, 92);
        log.Desired_alpha_z_rads2 = data.data(:, 93);

        log.Angle_roll_rad = data.data(:, 94);
        log.Angle_pitch_rad = data.data(:, 95);
        log.Angle_yaw_rad = data.data(:, 96);

        log.omega_x_rads = data.data(:, 97);
        log.omega_y_rads = data.data(:, 98);
        log.omega_z_rads = data.data(:, 99);

        log.omega_cmd_rot_x = data.data(:, 100);
        log.omega_cmd_rot_y = data.data(:, 101);
        log.omega_cmd_rot_z = data.data(:, 102); 

        log.Omega_ref_x = data.data(:, 103);
        log.Omega_ref_y = data.data(:, 104);
        log.Omega_ref_z = data.data(:, 105);

        log.alpha_ref_x = data.data(:, 106);
        log.alpha_ref_y = data.data(:, 107);
        log.alpha_ref_z = data.data(:, 108);

        log.Error_in_Euler_phi_rad = data.data(:, 109);
        log.Error_in_Euler_theta_rad = data.data(:, 110);
        log.Error_in_Euler_psi_rad = data.data(:, 111);    
        
        log.Integral_Error_in_phi_rads = data.data(:, 112);
        log.Integral_Error_in_theta_rads = data.data(:, 113);
        log.Integral_Error_in_psi_rads = data.data(:, 114);

        log.Reference_Error_omega_x = data.data(:, 115);
        log.Reference_Error_omega_y = data.data(:, 116);
        log.Reference_Error_omega_z = data.data(:, 117);

        log.Error_in_omega_x_rads = data.data(:, 118);
        log.Error_in_omega_y_rads = data.data(:, 119);
        log.Error_in_omega_z_rads = data.data(:, 120);
        
        log.Integral_Reference_Error_omega_x = data.data(:, 121);
        log.Integral_Reference_Error_omega_y = data.data(:, 122);
        log.Integral_Reference_Error_omega_z = data.data(:, 123);

        log.Tau_baseline_x = data.data(:, 124);
        log.Tau_baseline_y = data.data(:, 125);
        log.Tau_baseline_z = data.data(:, 126);
    
        log.Tau_adaptive_x = data.data(:, 127);
        log.Tau_adaptive_y = data.data(:, 128);
        log.Tau_adaptive_z = data.data(:, 129);
    
        log.Control_input_u1_N = data.data(:, 130);
        log.Control_input_u2_Nm = data.data(:, 131);
        log.Control_input_u3_Nm = data.data(:, 132);
        log.Control_input_u4_Nm = data.data(:, 133);
    
        log.Thrust_Motor_1_N = data.data(:, 134);
        log.Thrust_Motor_2_N = data.data(:, 135);
        log.Thrust_Motor_3_N = data.data(:, 136);
        log.Thrust_Motor_4_N = data.data(:, 137);
    
        log.Thrust_Motor_1_Normalized_N = data.data(:, 138);
        log.Thrust_Motor_2_Normalized_N = data.data(:, 139);
        log.Thrust_Motor_3_Normalized_N = data.data(:, 140);
        log.Thrust_Motor_4_Normalized_N = data.data(:, 141);  

        log.outer_loop.dead_zone_value = data.data(:, 142);
        log.inner_loop.dead_zone_value = data.data(:, 143);

        log.proj_op_activated.outer_loop.K_hat_x = data.data(:, 144);
        log.proj_op_activated.outer_loop.K_hat_r = data.data(:, 145);
        log.proj_op_activated.outer_loop.Theta_hat = data.data(:, 146);
        log.proj_op_activated.inner_loop.K_hat_x = data.data(:, 147);
        log.proj_op_activated.inner_loop.K_hat_r = data.data(:, 148);
        log.proj_op_activated.inner_loop.Theta_hat = data.data(:, 149);
        

        % Process gains data
        log = processGainMatrixLog(log, 'K_hat_x_tran', data, 150, 6, 3);
        log = processGainMatrixLog(log, 'K_hat_r_tran', data, 168, 3, 3);
        log = processGainMatrixLog(log, 'Theta_hat_tran', data, 177, 30, 3);
        log = processGainMatrixLog(log, 'K_hat_x_rot', data, 267, 3, 3);
        log = processGainMatrixLog(log, 'K_hat_r_rot', data, 276, 3, 3);
        log = processGainMatrixLog(log, 'Theta_hat_rot', data, 285, 12, 3);

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

        % Process the L2 norm of the tracking errors in the outer loop
        der.outer_loop.err_norm = sqrt(sum([log.Error_in_position_x_m, ...
                                            log.Error_in_position_y_m, ...
                                            log.Error_in_position_z_m, ...
                                            log.Error_in_velocity_x_ms, ...
                                            log.Error_in_velocity_y_ms, ...
                                            log.Error_in_velocity_z_ms].^2,2));

        % Process the L2 norm of the tracking errors in the inner loop
        der.inner_loop.err_norm = sqrt(sum([log.Error_in_Euler_phi_rad, ...
                                            log.Error_in_Euler_theta_rad, ...
                                            log.Error_in_Euler_psi_rad, ...
                                            log.Error_in_omega_x_rads, ...
                                            log.Error_in_omega_y_rads, ...
                                            log.Error_in_omega_z_rads].^2,2));

        % Get the upper and lower bounds for the projection operator
        der.outer_loop.projection_operator.up_bound.x = sqrt(gains.outer_loop.projection_operator.x_max.x + ...
            gains.outer_loop.projection_operator.epsilon.x);

        der.outer_loop.projection_operator.lw_bound.x = sqrt(gains.outer_loop.projection_operator.x_max.x);

        der.outer_loop.projection_operator.up_bound.r = sqrt(gains.outer_loop.projection_operator.x_max.r + ...
            gains.outer_loop.projection_operator.epsilon.r);

        der.outer_loop.projection_operator.lw_bound.r = sqrt(gains.outer_loop.projection_operator.x_max.r);

        der.outer_loop.projection_operator.up_bound.Theta = sqrt(gains.outer_loop.projection_operator.x_max.Theta + ...
            gains.outer_loop.projection_operator.epsilon.Theta);

        der.outer_loop.projection_operator.lw_bound.Theta = sqrt(gains.outer_loop.projection_operator.x_max.Theta);

        der.inner_loop.projection_operator.up_bound.x = sqrt(gains.inner_loop.projection_operator.x_max.x + ...
            gains.inner_loop.projection_operator.epsilon.x);

        der.inner_loop.projection_operator.lw_bound.x = sqrt(gains.inner_loop.projection_operator.x_max.x);

        der.inner_loop.projection_operator.up_bound.r = sqrt(gains.inner_loop.projection_operator.x_max.r + ...
            gains.inner_loop.projection_operator.epsilon.r);

        der.inner_loop.projection_operator.lw_bound.r = sqrt(gains.inner_loop.projection_operator.x_max.r);

        der.inner_loop.projection_operator.up_bound.Theta = sqrt(gains.inner_loop.projection_operator.x_max.Theta + ...
            gains.inner_loop.projection_operator.epsilon.Theta);
        
        der.inner_loop.projection_operator.lw_bound.Theta = sqrt(gains.inner_loop.projection_operator.x_max.Theta);

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
        file_name = ['MRAC_OMEGA_log_', flightRunNames{ii}, '.mat'];
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