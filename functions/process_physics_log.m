function [] = process_physics_log(flightRunNames, baseDir)
%PROCESS_PHYSICS_LOG Hard-coded parser for Chrono physics.log.
%
%   physics.chassis.*
%   physics.propeller_1.*
%   physics.propeller_2.*
%   physics.propeller_3.*
%   physics.propeller_4.*
%
%   Saves: physics_log_<run>.mat in each run folder.

    for ii = 1:length(flightRunNames)

        % -----------------------------------------------------------------
        % STEP 1 – Build path and load with importdata
        % -----------------------------------------------------------------
        log_file_path = fullfile(baseDir, flightRunNames{ii}, 'physics.log');

        if exist(log_file_path, 'file') ~= 2
            warning('Physics log file does not exist: %s', log_file_path);
            continue;
        end

        data = importdata(log_file_path);  % physics.log numeric matrix [file:73]

        % -----------------------------------------------------------------
        % STEP 2 – Hard-coded column → struct mapping
        %   Order taken from the physics.log header in your file.
        % -----------------------------------------------------------------
        physics = struct();

        col = 1;

        % -------- chassis --------
        physics.chassis.t        = data.data(:, col);  col = col + 1;  % chassis_t
        physics.chassis.x        = data.data(:, col);  col = col + 1;  % chassis_x
        physics.chassis.y        = data.data(:, col);  col = col + 1;  % chassis_y
        physics.chassis.z        = data.data(:, col);  col = col + 1;  % chassis_z

        physics.chassis.vx       = data.data(:, col);  col = col + 1;  % chassis_vx
        physics.chassis.vy       = data.data(:, col);  col = col + 1;  % chassis_vy
        physics.chassis.vz       = data.data(:, col);  col = col + 1;  % chassis_vz

        physics.chassis.ax       = data.data(:, col);  col = col + 1;  % chassis_ax
        physics.chassis.ay       = data.data(:, col);  col = col + 1;  % chassis_ay
        physics.chassis.az       = data.data(:, col);  col = col + 1;  % chassis_az

        physics.chassis.phi      = data.data(:, col);  col = col + 1;  % chassis_phi
        physics.chassis.theta    = data.data(:, col);  col = col + 1;  % chassis_theta
        physics.chassis.psi      = data.data(:, col);  col = col + 1;  % chassis_psi

        physics.chassis.phi_bp   = data.data(:, col);  col = col + 1;  % chassis_phi_bp
        physics.chassis.theta_bp = data.data(:, col);  col = col + 1;  % chassis_theta_bp
        physics.chassis.psi_bp   = data.data(:, col);  col = col + 1;  % chassis_psi_bp

        physics.chassis.q0       = data.data(:, col);  col = col + 1;  % chassis_q0
        physics.chassis.q1       = data.data(:, col);  col = col + 1;  % chassis_q1
        physics.chassis.q2       = data.data(:, col);  col = col + 1;  % chassis_q2
        physics.chassis.q3       = data.data(:, col);  col = col + 1;  % chassis_q3

        physics.chassis.q0_bp    = data.data(:, col);  col = col + 1;  % chassis_q0_bp
        physics.chassis.q1_bp    = data.data(:, col);  col = col + 1;  % chassis_q1_bp
        physics.chassis.q2_bp    = data.data(:, col);  col = col + 1;  % chassis_q2_bp
        physics.chassis.q3_bp    = data.data(:, col);  col = col + 1;  % chassis_q3_bp

        physics.chassis.wx       = data.data(:, col);  col = col + 1;  % chassis_wx
        physics.chassis.wy       = data.data(:, col);  col = col + 1;  % chassis_wy
        physics.chassis.wz       = data.data(:, col);  col = col + 1;  % chassis_wz

        physics.chassis.wx_bp    = data.data(:, col);  col = col + 1;  % chassis_wx_bp
        physics.chassis.wy_bp    = data.data(:, col);  col = col + 1;  % chassis_wy_bp
        physics.chassis.wz_bp    = data.data(:, col);  col = col + 1;  % chassis_wz_bp

        physics.chassis.alphx    = data.data(:, col);  col = col + 1;  % chassis_alphx
        physics.chassis.alphy    = data.data(:, col);  col = col + 1;  % chassis_alphy
        physics.chassis.alphz    = data.data(:, col);  col = col + 1;  % chassis_alphz

        physics.chassis.alphx_bp = data.data(:, col);  col = col + 1;  % chassis_alphx_bp
        physics.chassis.alphy_bp = data.data(:, col);  col = col + 1;  % chassis_alphy_bp
        physics.chassis.alphz_bp = data.data(:, col);  col = col + 1;  % chassis_alphz_bp

        physics.chassis.muIx     = data.data(:, col);  col = col + 1;  % chassis_muIx
        physics.chassis.muIy     = data.data(:, col);  col = col + 1;  % chassis_muIy
        physics.chassis.muIz     = data.data(:, col);  col = col + 1;  % chassis_muIz

        physics.chassis.muJx     = data.data(:, col);  col = col + 1;  % chassis_muJx
        physics.chassis.muJy     = data.data(:, col);  col = col + 1;  % chassis_muJy
        physics.chassis.muJz     = data.data(:, col);  col = col + 1;  % chassis_muJz

        physics.chassis.tauJx    = data.data(:, col);  col = col + 1;  % chassis_tauJx
        physics.chassis.tauJy    = data.data(:, col);  col = col + 1;  % chassis_tauJy
        physics.chassis.tauJz    = data.data(:, col);  col = col + 1;  % chassis_tau_Jz

        % -------- propeller 1 --------
        physics.propeller_1.t        = data.data(:, col);  col = col + 1;
        physics.propeller_1.x        = data.data(:, col);  col = col + 1;
        physics.propeller_1.y        = data.data(:, col);  col = col + 1;
        physics.propeller_1.z        = data.data(:, col);  col = col + 1;

        physics.propeller_1.vx       = data.data(:, col);  col = col + 1;
        physics.propeller_1.vy       = data.data(:, col);  col = col + 1;
        physics.propeller_1.vz       = data.data(:, col);  col = col + 1;

        physics.propeller_1.ax       = data.data(:, col);  col = col + 1;
        physics.propeller_1.ay       = data.data(:, col);  col = col + 1;
        physics.propeller_1.az       = data.data(:, col);  col = col + 1;

        physics.propeller_1.phi      = data.data(:, col);  col = col + 1;
        physics.propeller_1.theta    = data.data(:, col);  col = col + 1;
        physics.propeller_1.psi      = data.data(:, col);  col = col + 1;

        physics.propeller_1.phi_bp   = data.data(:, col);  col = col + 1;
        physics.propeller_1.theta_bp = data.data(:, col);  col = col + 1;
        physics.propeller_1.psi_bp   = data.data(:, col);  col = col + 1;

        physics.propeller_1.q0       = data.data(:, col);  col = col + 1;
        physics.propeller_1.q1       = data.data(:, col);  col = col + 1;
        physics.propeller_1.q2       = data.data(:, col);  col = col + 1;
        physics.propeller_1.q3       = data.data(:, col);  col = col + 1;

        physics.propeller_1.q0_bp    = data.data(:, col);  col = col + 1;
        physics.propeller_1.q1_bp    = data.data(:, col);  col = col + 1;
        physics.propeller_1.q2_bp    = data.data(:, col);  col = col + 1;
        physics.propeller_1.q3_bp    = data.data(:, col);  col = col + 1;

        physics.propeller_1.wx       = data.data(:, col);  col = col + 1;
        physics.propeller_1.wy       = data.data(:, col);  col = col + 1;
        physics.propeller_1.wz       = data.data(:, col);  col = col + 1;

        physics.propeller_1.wx_bp    = data.data(:, col);  col = col + 1;
        physics.propeller_1.wy_bp    = data.data(:, col);  col = col + 1;
        physics.propeller_1.wz_bp    = data.data(:, col);  col = col + 1;

        physics.propeller_1.alphx    = data.data(:, col);  col = col + 1;
        physics.propeller_1.alphy    = data.data(:, col);  col = col + 1;
        physics.propeller_1.alphz    = data.data(:, col);  col = col + 1;

        physics.propeller_1.alphx_bp = data.data(:, col);  col = col + 1;
        physics.propeller_1.alphy_bp = data.data(:, col);  col = col + 1;
        physics.propeller_1.alphz_bp = data.data(:, col);  col = col + 1;

        physics.propeller_1.muIx     = data.data(:, col);  col = col + 1;
        physics.propeller_1.muIy     = data.data(:, col);  col = col + 1;
        physics.propeller_1.muIz     = data.data(:, col);  col = col + 1;

        physics.propeller_1.muJx     = data.data(:, col);  col = col + 1;
        physics.propeller_1.muJy     = data.data(:, col);  col = col + 1;
        physics.propeller_1.muJz     = data.data(:, col);  col = col + 1;

        physics.propeller_1.tauJx    = data.data(:, col);  col = col + 1;
        physics.propeller_1.tauJy    = data.data(:, col);  col = col + 1;
        physics.propeller_1.tauJz    = data.data(:, col);  col = col + 1;

        % -------- propeller 2 --------
        physics.propeller_2.t        = data.data(:, col);  col = col + 1;
        physics.propeller_2.x        = data.data(:, col);  col = col + 1;
        physics.propeller_2.y        = data.data(:, col);  col = col + 1;
        physics.propeller_2.z        = data.data(:, col);  col = col + 1;

        physics.propeller_2.vx       = data.data(:, col);  col = col + 1;
        physics.propeller_2.vy       = data.data(:, col);  col = col + 1;
        physics.propeller_2.vz       = data.data(:, col);  col = col + 1;

        physics.propeller_2.ax       = data.data(:, col);  col = col + 1;
        physics.propeller_2.ay       = data.data(:, col);  col = col + 1;
        physics.propeller_2.az       = data.data(:, col);  col = col + 1;

        physics.propeller_2.phi      = data.data(:, col);  col = col + 1;
        physics.propeller_2.theta    = data.data(:, col);  col = col + 1;
        physics.propeller_2.psi      = data.data(:, col);  col = col + 1;

        physics.propeller_2.phi_bp   = data.data(:, col);  col = col + 1;
        physics.propeller_2.theta_bp = data.data(:, col);  col = col + 1;
        physics.propeller_2.psi_bp   = data.data(:, col);  col = col + 1;

        physics.propeller_2.q0       = data.data(:, col);  col = col + 1;
        physics.propeller_2.q1       = data.data(:, col);  col = col + 1;
        physics.propeller_2.q2       = data.data(:, col);  col = col + 1;
        physics.propeller_2.q3       = data.data(:, col);  col = col + 1;

        physics.propeller_2.q0_bp    = data.data(:, col);  col = col + 1;
        physics.propeller_2.q1_bp    = data.data(:, col);  col = col + 1;
        physics.propeller_2.q2_bp    = data.data(:, col);  col = col + 1;
        physics.propeller_2.q3_bp    = data.data(:, col);  col = col + 1;

        physics.propeller_2.wx       = data.data(:, col);  col = col + 1;
        physics.propeller_2.wy       = data.data(:, col);  col = col + 1;
        physics.propeller_2.wz       = data.data(:, col);  col = col + 1;

        physics.propeller_2.wx_bp    = data.data(:, col);  col = col + 1;
        physics.propeller_2.wy_bp    = data.data(:, col);  col = col + 1;
        physics.propeller_2.wz_bp    = data.data(:, col);  col = col + 1;

        physics.propeller_2.alphx    = data.data(:, col);  col = col + 1;
        physics.propeller_2.alphy    = data.data(:, col);  col = col + 1;
        physics.propeller_2.alphz    = data.data(:, col);  col = col + 1;

        physics.propeller_2.alphx_bp = data.data(:, col);  col = col + 1;
        physics.propeller_2.alphy_bp = data.data(:, col);  col = col + 1;
        physics.propeller_2.alphz_bp = data.data(:, col);  col = col + 1;

        physics.propeller_2.muIx     = data.data(:, col);  col = col + 1;
        physics.propeller_2.muIy     = data.data(:, col);  col = col + 1;
        physics.propeller_2.muIz     = data.data(:, col);  col = col + 1;

        physics.propeller_2.muJx     = data.data(:, col);  col = col + 1;
        physics.propeller_2.muJy     = data.data(:, col);  col = col + 1;
        physics.propeller_2.muJz     = data.data(:, col);  col = col + 1;

        physics.propeller_2.tauJx    = data.data(:, col);  col = col + 1;
        physics.propeller_2.tauJy    = data.data(:, col);  col = col + 1;
        physics.propeller_2.tauJz    = data.data(:, col);  col = col + 1;

        % -------- propeller 3 --------
        physics.propeller_3.t        = data.data(:, col);  col = col + 1;
        physics.propeller_3.x        = data.data(:, col);  col = col + 1;
        physics.propeller_3.y        = data.data(:, col);  col = col + 1;
        physics.propeller_3.z        = data.data(:, col);  col = col + 1;

        physics.propeller_3.vx       = data.data(:, col);  col = col + 1;
        physics.propeller_3.vy       = data.data(:, col);  col = col + 1;
        physics.propeller_3.vz       = data.data(:, col);  col = col + 1;

        physics.propeller_3.ax       = data.data(:, col);  col = col + 1;
        physics.propeller_3.ay       = data.data(:, col);  col = col + 1;
        physics.propeller_3.az       = data.data(:, col);  col = col + 1;

        physics.propeller_3.phi      = data.data(:, col);  col = col + 1;
        physics.propeller_3.theta    = data.data(:, col);  col = col + 1;
        physics.propeller_3.psi      = data.data(:, col);  col = col + 1;

        physics.propeller_3.phi_bp   = data.data(:, col);  col = col + 1;
        physics.propeller_3.theta_bp = data.data(:, col);  col = col + 1;
        physics.propeller_3.psi_bp   = data.data(:, col);  col = col + 1;

        physics.propeller_3.q0       = data.data(:, col);  col = col + 1;
        physics.propeller_3.q1       = data.data(:, col);  col = col + 1;
        physics.propeller_3.q2       = data.data(:, col);  col = col + 1;
        physics.propeller_3.q3       = data.data(:, col);  col = col + 1;

        physics.propeller_3.q0_bp    = data.data(:, col);  col = col + 1;
        physics.propeller_3.q1_bp    = data.data(:, col);  col = col + 1;
        physics.propeller_3.q2_bp    = data.data(:, col);  col = col + 1;
        physics.propeller_3.q3_bp    = data.data(:, col);  col = col + 1;

        physics.propeller_3.wx       = data.data(:, col);  col = col + 1;
        physics.propeller_3.wy       = data.data(:, col);  col = col + 1;
        physics.propeller_3.wz       = data.data(:, col);  col = col + 1;

        physics.propeller_3.wx_bp    = data.data(:, col);  col = col + 1;
        physics.propeller_3.wy_bp    = data.data(:, col);  col = col + 1;
        physics.propeller_3.wz_bp    = data.data(:, col);  col = col + 1;

        physics.propeller_3.alphx    = data.data(:, col);  col = col + 1;
        physics.propeller_3.alphy    = data.data(:, col);  col = col + 1;
        physics.propeller_3.alphz    = data.data(:, col);  col = col + 1;

        physics.propeller_3.alphx_bp = data.data(:, col);  col = col + 1;
        physics.propeller_3.alphy_bp = data.data(:, col);  col = col + 1;
        physics.propeller_3.alphz_bp = data.data(:, col);  col = col + 1;

        physics.propeller_3.muIx     = data.data(:, col);  col = col + 1;
        physics.propeller_3.muIy     = data.data(:, col);  col = col + 1;
        physics.propeller_3.muIz     = data.data(:, col);  col = col + 1;

        physics.propeller_3.muJx     = data.data(:, col);  col = col + 1;
        physics.propeller_3.muJy     = data.data(:, col);  col = col + 1;
        physics.propeller_3.muJz     = data.data(:, col);  col = col + 1;

        physics.propeller_3.tauJx    = data.data(:, col);  col = col + 1;
        physics.propeller_3.tauJy    = data.data(:, col);  col = col + 1;
        physics.propeller_3.tauJz    = data.data(:, col);  col = col + 1;

        % -------- propeller 4 --------
        physics.propeller_4.t        = data.data(:, col);  col = col + 1;
        physics.propeller_4.x        = data.data(:, col);  col = col + 1;
        physics.propeller_4.y        = data.data(:, col);  col = col + 1;
        physics.propeller_4.z        = data.data(:, col);  col = col + 1;

        physics.propeller_4.vx       = data.data(:, col);  col = col + 1;
        physics.propeller_4.vy       = data.data(:, col);  col = col + 1;
        physics.propeller_4.vz       = data.data(:, col);  col = col + 1;

        physics.propeller_4.ax       = data.data(:, col);  col = col + 1;
        physics.propeller_4.ay       = data.data(:, col);  col = col + 1;
        physics.propeller_4.az       = data.data(:, col);  col = col + 1;

        physics.propeller_4.phi      = data.data(:, col);  col = col + 1;
        physics.propeller_4.theta    = data.data(:, col);  col = col + 1;
        physics.propeller_4.psi      = data.data(:, col);  col = col + 1;

        physics.propeller_4.phi_bp   = data.data(:, col);  col = col + 1;
        physics.propeller_4.theta_bp = data.data(:, col);  col = col + 1;
        physics.propeller_4.psi_bp   = data.data(:, col);  col = col + 1;

        physics.propeller_4.q0       = data.data(:, col);  col = col + 1;
        physics.propeller_4.q1       = data.data(:, col);  col = col + 1;
        physics.propeller_4.q2       = data.data(:, col);  col = col + 1;
        physics.propeller_4.q3       = data.data(:, col);  col = col + 1;

        physics.propeller_4.q0_bp    = data.data(:, col);  col = col + 1;
        physics.propeller_4.q1_bp    = data.data(:, col);  col = col + 1;
        physics.propeller_4.q2_bp    = data.data(:, col);  col = col + 1;
        physics.propeller_4.q3_bp    = data.data(:, col);  col = col + 1;

        physics.propeller_4.wx       = data.data(:, col);  col = col + 1;
        physics.propeller_4.wy       = data.data(:, col);  col = col + 1;
        physics.propeller_4.wz       = data.data(:, col);  col = col + 1;

        physics.propeller_4.wx_bp    = data.data(:, col);  col = col + 1;
        physics.propeller_4.wy_bp    = data.data(:, col);  col = col + 1;
        physics.propeller_4.wz_bp    = data.data(:, col);  col = col + 1;

        physics.propeller_4.alphx    = data.data(:, col);  col = col + 1;
        physics.propeller_4.alphy    = data.data(:, col);  col = col + 1;
        physics.propeller_4.alphz    = data.data(:, col);  col = col + 1;

        physics.propeller_4.alphx_bp = data.data(:, col);  col = col + 1;
        physics.propeller_4.alphy_bp = data.data(:, col);  col = col + 1;
        physics.propeller_4.alphz_bp = data.data(:, col);  col = col + 1;

        physics.propeller_4.muIx     = data.data(:, col);  col = col + 1;
        physics.propeller_4.muIy     = data.data(:, col);  col = col + 1;
        physics.propeller_4.muIz     = data.data(:, col);  col = col + 1;

        physics.propeller_4.muJx     = data.data(:, col);  col = col + 1;
        physics.propeller_4.muJy     = data.data(:, col);  col = col + 1;
        physics.propeller_4.muJz     = data.data(:, col);  col = col + 1;

        physics.propeller_4.tauJx    = data.data(:, col);  col = col + 1;
        physics.propeller_4.tauJy    = data.data(:, col);  col = col + 1;
        physics.propeller_4.tauJz    = data.data(:, col);  col = col + 1;

        % -----------------------------------------------------------------
        % STEP 3 – Save .mat file
        % -----------------------------------------------------------------
        folder_path = fullfile(baseDir, flightRunNames{ii});
        file_name   = ['physics_log_', flightRunNames{ii}, '.mat'];
        full_path   = fullfile(folder_path, file_name);

        save(full_path, 'physics');
        disp(['Physics data saved to ', full_path]);
    end
end
