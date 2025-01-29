%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This code used to plot the data saved in createWorkspace.m. Just pick the
% data you want to plot and then plot it. You can double click on the .mat
% file in the respective flight_run_ folders.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Suppress some messages for brackets and other coding errors that is
% annoying - giri
%#ok<*NBRAK2>
%#ok<*CLALL>
close all
set(groot, 'defaultAxesTickLabelInterpreter','latex');
set(groot, 'defaultLegendInterpreter','latex');
set(groot, 'defaultAxesFontSize', 30); 
addpath("plotters/helpers/general/");
addpath("plotters/helpers/mocap/");
addpath("plotters/helpers/vio/");
addpath("plotters/helpers/mocap_vio/");
addpath("plotters/helpers/mrac_pid/");
addpath("plotters/helpers/general/aerodynamics/");
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 07/19/2024
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Plot the translational user, reference and states.
plotPosRefUser(log, 'MRAC - Translational Position');

%% Plot the translational velocity user, reference and states.
plotVelRefUser(log, 'MRAC - Translational Velocity');

%% Plot the translational Acceleration user and reference.
plotUserRefAcceleration(log, 'MRAC - Translational Acceleration');

%% Plot the errors in the translational outer loop
plotTranslationalError(log, 'MRAC - Translational Error');

%% Integral Error in Position
plotTranslationalIntError(log, 'MRAC - Integral error in Position');

%% Reference Errors in Position
set(figure,'Color','white')
subplot(2,1,1)
plot(log.Controller_Time_s,log.Reference_Error_in_position_x_m, 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.Reference_Error_in_position_y_m, 'LineWidth',2)  
plot(log.Controller_Time_s,log.Reference_Error_in_position_z_m, 'LineWidth',2)
quad_biplane_plotter(log.is_biplane, log.Controller_Time_s, ...
                     [log.Reference_Error_in_position_x_m; ...
                     log.Reference_Error_in_position_y_m; ...
                     log.Reference_Error_in_position_z_m]);
hold off
l= legend('$$e_{\rm x,ref}^{\mathbf{I}}(t)$$', ...
          '$$e_{\rm y,ref}^{\mathbf{I}}(t)$$', ...
          '$$e_{\rm z,ref}^{\mathbf{I}}(t)$$', ...
          'Quad', 'Biplane');
set(l,'interpreter','latex','fontsize',15);
ylabel('[m]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(2,1,2)
plot(log.Controller_Time_s,log.Integral_Reference_Error_in_position_x_m, 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.Integral_Reference_Error_in_position_y_m, 'LineWidth',2)
plot(log.Controller_Time_s,log.Integral_Reference_Error_in_position_z_m, 'LineWidth',2)
quad_biplane_plotter(log.is_biplane, log.Controller_Time_s, ...
                     [log.Integral_Reference_Error_in_position_x_m; ...
                     log.Integral_Reference_Error_in_position_y_m; ...
                     log.Integral_Reference_Error_in_position_z_m]);
hold off
l= legend('$$\int e_{\rm x,ref}^{\mathbf{I}}(t)$$', ...
          '$$\int e_{\rm y,ref}^{\mathbf{I}}(t)$$', ...
          '$$\int e_{\rm z,ref}^{\mathbf{I}}(t)$$', ...
          'Quad', 'Biplane');
set(l,'interpreter','latex','fontsize',15);
ylabel('[-]','interpreter','latex','fontsize',20)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle('Translational Reference Errors','Interpreter','latex','FontSize',20);

%% Translational r_cmd
set(figure,'Color','White')
plot(log.Controller_Time_s,log.r_cmd_in_position_x, 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.r_cmd_in_position_y, 'LineWidth',2)
plot(log.Controller_Time_s,log.r_cmd_in_position_z, 'LineWidth',2)
quad_biplane_plotter(log.is_biplane, log.Controller_Time_s, ...
                     [log.r_cmd_in_position_x; ...
                     log.r_cmd_in_position_y; ...
                     log.r_cmd_in_position_z]);
hold off
l= legend('$$r_{\rm cmd, x}(t)$$','$$r_{\rm cmd, y}(t)$$','$$r_{\rm cmd, z}(t)$$','Quad','Biplane');
set(l,'interpreter','latex','fontsize',15);
ylabel('[-]','interpreter','latex','fontsize',20)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle('Translational $$r_{\rm cmd}$$','Interpreter','latex','FontSize',20);

%% Translational outerloop virtual controls
set(figure,'Color','white')
subplot(3,1,1)
plot(log.Controller_Time_s,log.mu_tran_baseline_x, 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.mu_tran_baseline_y, 'LineWidth',2)  
plot(log.Controller_Time_s,log.mu_tran_baseline_z, 'LineWidth',2)
quad_biplane_plotter(log.is_biplane, log.Controller_Time_s, ...
                     [log.mu_tran_baseline_x; ...
                     log.mu_tran_baseline_y; ...
                     log.mu_tran_baseline_z]);
hold off
l= legend('$$\mu_{\rm x,baseline}^{\mathbf{I}}(t)$$', ...
          '$$\mu_{\rm y,baseline}^{\mathbf{I}}(t)$$', ...
          '$$\mu_{\rm z,baseline}^{\mathbf{I}}(t)$$', ...
          'Quad', 'Biplane');
set(l,'interpreter','latex','fontsize',15);
ylabel('[N]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,2)
plot(log.Controller_Time_s,log.mu_tran_adaptive_x, 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.mu_tran_adaptive_y, 'LineWidth',2)
plot(log.Controller_Time_s,log.mu_tran_adaptive_z, 'LineWidth',2)
quad_biplane_plotter(log.is_biplane, log.Controller_Time_s, ...
                     [log.mu_tran_adaptive_x; ...
                     log.mu_tran_adaptive_y; ...
                     log.mu_tran_adaptive_z]);
hold off
l= legend('$$\mu_{\rm x,adaptive}^{\mathbf{I}}(t)$$', ...
          '$$\mu_{\rm y,adaptive}^{\mathbf{I}}(t)$$', ...
          '$$\mu_{\rm z,adaptive}^{\mathbf{I}}(t)$$', ...
          'Quad','Biplane');
set(l,'interpreter','latex','fontsize',15);
ylabel('[N]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,3)
plot(log.Controller_Time_s,der.mu_tran_x, 'LineWidth',2)
hold on
plot(log.Controller_Time_s,der.mu_tran_y, 'LineWidth',2)
plot(log.Controller_Time_s,der.mu_tran_z, 'LineWidth',2)
quad_biplane_plotter(log.is_biplane, log.Controller_Time_s, ...
                     [der.mu_tran_x; ...
                     der.mu_tran_y; ...
                     der.mu_tran_z]);
hold off
l= legend('$$\mu_{\rm x}^{\mathbf{I}}(t)$$', ...
          '$$\mu_{\rm y}^{\mathbf{I}}(t)$$', ...
          '$$\mu_{\rm z}^{\mathbf{I}}(t)$$', ...
          'Quad','Biplane');
set(l,'interpreter','latex','fontsize',15);
ylabel('[N]','interpreter','latex','fontsize',20)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle('Translational Virtual Forces','Interpreter','latex','FontSize',20);

%% virtual forces in Body frame
set(figure,'Color','White')
plot(log.Controller_Time_s,log.mu_tran_J_x, 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.mu_tran_J_y, 'LineWidth',2)
plot(log.Controller_Time_s,log.mu_tran_J_z, 'LineWidth',2)
quad_biplane_plotter(log.is_biplane, log.Controller_Time_s, ...
                     [log.mu_tran_J_x; ...
                     log.mu_tran_J_y; ...
                     log.mu_tran_J_z]);
hold off
l= legend('$$\mu_{\rm tran, x}^{\mathbf{J}}(t)$$','$$\mu_{\rm tran, y}^{\mathbf{J}}(t)$$','$$\mu_{\rm tran, z}^{\mathbf{J}}(t)$$','Quad','Biplane');
set(l,'interpreter','latex','fontsize',15);
ylabel('[N]','interpreter','latex','fontsize',20)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle('Virtual Translational Forces in Body $$\mathbf{J}$$','Interpreter','latex','FontSize',20);

%% Euler Angles
set(figure,'Color','white')
subplot(3,1,1)
plot(log.Controller_Time_s,rad2deg(log.Desired_phi_rad),'r-.', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,rad2deg(log.Angle_roll_rad),'k-', 'LineWidth',2)
quad_biplane_plotter(log.is_biplane, log.Controller_Time_s, ...
                     [rad2deg(log.Desired_phi_rad); ...
                     rad2deg(log.Angle_roll_rad)]);
hold off
l= legend('$$\phi_{\rm desired}(t)$$','$$\phi(t)$$','Quad','Biplane');
set(l,'interpreter','latex','fontsize',15);
ylabel('[deg]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,2)
plot(log.Controller_Time_s,rad2deg(log.Desired_theta_rad),'r-.', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,rad2deg(log.Angle_pitch_rad),'k-', 'LineWidth',2)
quad_biplane_plotter(log.is_biplane, log.Controller_Time_s, ...
                     [rad2deg(log.Desired_theta_rad); ...
                     rad2deg(log.Angle_pitch_rad)]);
hold off
l= legend('$$\theta_{\rm desired}(t)$$','$$\theta(t)$$','Quad','Biplane');
set(l,'interpreter','latex','fontsize',15);
ylabel('[deg]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,3)
plot(log.Controller_Time_s,rad2deg(log.Desired_psi_rad),'r-.', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,rad2deg(log.Angle_yaw_rad),'k-', 'LineWidth',2)
quad_biplane_plotter(log.is_biplane, log.Controller_Time_s, ...
                     [rad2deg(log.Desired_psi_rad); ...
                     rad2deg(log.Angle_yaw_rad)]);
hold off
l= legend('$$\psi_{\rm desired}(t)$$','$$\psi(t)$$','Quad','Biplane');
set(l,'interpreter','latex','fontsize',15);
ylabel('[deg]','interpreter','latex','fontsize',20)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle('Euler Angles','Interpreter','latex','FontSize',20);

%% Euler Angles in Biplane and quad
set(figure,'Color','white')
subplot(3,1,1)
plot(log.Controller_Time_s,rad2deg(log.Angle_roll_rad_q), 'k-', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,rad2deg(log.Angle_roll_rad_b), 'b-.', 'LineWidth',2)
% plot(log.Controller_Time_s,rad2deg(der.phi_B), 'LineWidth',2)
% quad_biplane_plotter(log.is_biplane, log.Controller_Time_s, ...
%                      [rad2deg(log.Angle_roll_rad_q); ...
%                      rad2deg(log.Angle_roll_rad_b)]);
hold off
% l= legend('$$\phi_{\rm quad}(t)$$','$$\phi_{\rm biplane}(t)$$','$$\phi_{\rm biplane, post}(t)$$','Quad','Biplane');
l= legend('$$\phi_{\rm quad}(t)$$','$$\phi_{\rm biplane}(t)$$','Quad','Biplane');
set(l,'interpreter','latex','fontsize',15);
ylabel('[deg]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,2)
plot(log.Controller_Time_s,rad2deg(log.Angle_pitch_rad_q), 'k-', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,rad2deg(log.Angle_pitch_rad_b), 'b-.', 'LineWidth',2)
% plot(log.Controller_Time_s,rad2deg(der.theta_B), 'LineWidth',2)
% quad_biplane_plotter(log.is_biplane, log.Controller_Time_s, ...
%                      [rad2deg(log.Angle_pitch_rad_q); ...
%                      rad2deg(log.Angle_pitch_rad_b)]);
% hold off
% l= legend('$$\theta_{\rm quad}(t)$$','$$\theta_{\rm biplane}(t)$$','$$\theta_{\rm biplane, post}(t)$$','Quad','Biplane');
l= legend('$$\theta_{\rm quad}(t)$$','$$\theta_{\rm biplane}(t)$$','Quad','Biplane');
set(l,'interpreter','latex','fontsize',15);
ylabel('[deg]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,3)
plot(log.Controller_Time_s,rad2deg(log.Angle_yaw_rad_q), 'k-', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,rad2deg(log.Angle_yaw_rad_b), 'b-.', 'LineWidth',2)
% plot(log.Controller_Time_s,rad2deg(der.psi_B), 'LineWidth',2)
% quad_biplane_plotter(log.is_biplane, log.Controller_Time_s, ...
%                      [rad2deg(log.Angle_yaw_rad_q); ...
%                      rad2deg(log.Angle_yaw_rad_b)]);
hold off
% l= legend('$$\psi_{\rm quad}(t)$$','$$\psi_{\rm biplane}(t)$$','$$\psi_{\rm biplane, post}(t)$$','Quad','Biplane');
l= legend('$$\psi_{\rm quad}(t)$$','$$\psi_{\rm biplane}(t)$$','Quad','Biplane');
set(l,'interpreter','latex','fontsize',15);
ylabel('[deg]','interpreter','latex','fontsize',20)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle('Euler Angles','Interpreter','latex','FontSize',20);

%% Euler Angles in Biplane and quad - Post Processed By Matlab
set(figure,'Color','white')
subplot(3,1,1)
plot(log.Controller_Time_s,rad2deg(log.Angle_roll_rad_q),'k-', 'LineWidth',2)
hold on
% plot(log.Controller_Time_s,rad2deg(log.Angle_roll_rad_b), 'LineWidth',2)
plot(log.Controller_Time_s,rad2deg(der.phi_B), 'r-.', 'LineWidth',2)
% quad_biplane_plotter(log.is_biplane, log.Controller_Time_s, ...
%                      [rad2deg(log.Angle_roll_rad_q); ...
%                      rad2deg(log.Angle_roll_rad_b)]);
hold off
l= legend('$$\phi_{\rm quad}(t)$$','$$\phi_{\rm biplane, post}(t)$$','Quad','Biplane');
% l= legend('$$\phi_{\rm quad}(t)$$','$$\phi_{\rm biplane}(t)$$','Quad','Biplane');
set(l,'interpreter','latex','fontsize',15);
ylabel('[deg]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,2)
plot(log.Controller_Time_s,rad2deg(log.Angle_pitch_rad_q),'k-', 'LineWidth',2)
hold on
% plot(log.Controller_Time_s,rad2deg(log.Angle_pitch_rad_b), 'LineWidth',2)
plot(log.Controller_Time_s,rad2deg(der.theta_B),'r-.', 'LineWidth',2)
% quad_biplane_plotter(log.is_biplane, log.Controller_Time_s, ...
%                      [rad2deg(log.Angle_pitch_rad_q); ...
%                      rad2deg(log.Angle_pitch_rad_b)]);
% hold off
l= legend('$$\theta_{\rm quad}(t)$$','$$\theta_{\rm biplane, post}(t)$$','Quad','Biplane');
% l= legend('$$\theta_{\rm quad}(t)$$','$$\theta_{\rm biplane}(t)$$','Quad','Biplane');
set(l,'interpreter','latex','fontsize',15);
ylabel('[deg]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,3)
plot(log.Controller_Time_s,rad2deg(log.Angle_yaw_rad_q), 'k-','LineWidth',2)
hold on
% plot(log.Controller_Time_s,rad2deg(log.Angle_yaw_rad_b), 'LineWidth',2)
plot(log.Controller_Time_s,rad2deg(der.psi_B),'r-.', 'LineWidth',2)
% quad_biplane_plotter(log.is_biplane, log.Controller_Time_s, ...
%                      [rad2deg(log.Angle_yaw_rad_q); ...
%                      rad2deg(log.Angle_yaw_rad_b)]);
hold off
l= legend('$$\psi_{\rm quad}(t)$$','$$\psi_{\rm biplane, post}(t)$$','Quad','Biplane');
% l= legend('$$\psi_{\rm quad}(t)$$','$$\psi_{\rm biplane}(t)$$','Quad','Biplane');
set(l,'interpreter','latex','fontsize',15);
ylabel('[deg]','interpreter','latex','fontsize',20)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle('Euler Angles','Interpreter','latex','FontSize',20);

%% Euler Angles Rates
set(figure,'Color','white')
subplot(3,1,1)
plot(log.Controller_Time_s,log.Desired_phi_dot_rads,'r-.', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.Angular_rates_x_rads,'k-', 'LineWidth',2)
quad_biplane_plotter(log.is_biplane, log.Controller_Time_s, ...
                     [log.Desired_phi_dot_rads; ...
                     log.Angular_rates_x_rads]);
hold off
l= legend('$$\dot{\phi}_{\rm desired}(t)$$','$$\dot{\phi}(t)$$','Quad','Biplane');
set(l,'interpreter','latex','fontsize',15);
ylabel('[rad/s]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,2)
plot(log.Controller_Time_s,log.Desired_theta_dot_rads,'r-.', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.Angular_rates_y_rads,'k-', 'LineWidth',2)
quad_biplane_plotter(log.is_biplane, log.Controller_Time_s, ...
                     [log.Desired_theta_dot_rads; ...
                     log.Angular_rates_y_rads]);
hold off
l= legend('$$\dot{\theta}_{\rm desired}(t)$$','$$\dot{\theta}(t)$$','Quad','Biplane');
set(l,'interpreter','latex','fontsize',15);
ylabel('[rad/s]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,3)
plot(log.Controller_Time_s,log.Desired_psi_dot_rads,'r-.', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.Angular_rates_z_rads,'k-', 'LineWidth',2)
quad_biplane_plotter(log.is_biplane, log.Controller_Time_s, ...
                     [log.Desired_psi_dot_rads; ...
                     log.Angular_rates_z_rads]);
hold off
l= legend('$$\dot{\psi}_{\rm desired}(t)$$','$$\dot{\psi(}t)$$','Quad','Biplane');
set(l,'interpreter','latex','fontsize',15);
ylabel('[rad/s]','interpreter','latex','fontsize',20)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle('Euler Rates','Interpreter','latex','FontSize',20);

%% Error in Angle and Angular Rates
set(figure,'Color','White')
subplot(2,1,1)
plot(log.Controller_Time_s,rad2deg(log.Error_in_Euler_phi_rad), 'LineWidth',2)
hold on
plot(log.Controller_Time_s,rad2deg(log.Error_in_Euler_theta_rad), 'LineWidth',2)
plot(log.Controller_Time_s,rad2deg(log.Error_in_Euler_psi_rad), 'LineWidth',2)
quad_biplane_plotter(log.is_biplane, log.Controller_Time_s, ...
                     [rad2deg(log.Error_in_Euler_phi_rad); ...
                      rad2deg(log.Error_in_Euler_theta_rad); ...
                      rad2deg(log.Error_in_Euler_psi_rad)]);
hold off
l= legend('$$e_{\phi}(t)$$','$$e_{\theta}(t)$$','$$e_{\psi}(t)$$','Quad','Biplane');
set(l,'interpreter','latex','fontsize',15);
ylabel('[deg]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(2,1,2)
plot(log.Controller_Time_s,log.Error_in_Euler_phi_rate_rads, 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.Error_in_Euler_theta_rate_rads, 'LineWidth',2)
plot(log.Controller_Time_s,log.Error_in_Euler_psi_rate_rads, 'LineWidth',2)
quad_biplane_plotter(log.is_biplane, log.Controller_Time_s, ...
                     [log.Error_in_Euler_phi_rate_rads; ...
                      log.Error_in_Euler_theta_rate_rads; ...
                      log.Error_in_Euler_psi_rate_rads]);
hold off
l= legend('$$e_{\dot{\phi}}(t)$$','$$e_{\dot{\theta}}(t)$$','$$e_{\dot{\psi}}(t)$$', 'Quad', 'Biplane');
set(l,'interpreter','latex','fontsize',15);
ylabel('[rad/s]','interpreter','latex','fontsize',20)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle('Error In Euler Angle and Rates','Interpreter','latex','FontSize',20);

%% Integral Error in Euler Angles
set(figure,'Color','White')
plot(log.Controller_Time_s,rad2deg(log.Integral_Error_in_phi_rads), 'LineWidth',2)
hold on
plot(log.Controller_Time_s,rad2deg(log.Integral_Error_in_theta_rads), 'LineWidth',2)
plot(log.Controller_Time_s,rad2deg(log.Integral_Error_in_psi_rads), 'LineWidth',2)
quad_biplane_plotter(log.is_biplane, log.Controller_Time_s, ...
                     [rad2deg(log.Integral_Error_in_phi_rads); ...
                      rad2deg(log.Integral_Error_in_theta_rads); ...
                      rad2deg(log.Integral_Error_in_psi_rads)]);
hold off
l= legend('$$\int e_{\phi}(t)$$','$$\int e_{\theta}(t)$$','$$\int e_{\psi}(t)$$','Quad','Biplane');
set(l,'interpreter','latex','fontsize',15);
ylabel('[-]','interpreter','latex','fontsize',20)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle('Integral error in Euler Angles','Interpreter','latex','FontSize',20);

%% Inner loop Angular velocities
set(figure,'Color','white')
subplot(3,1,1)
plot(log.Controller_Time_s,log.omega_cmd_rot_x,'r-.', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.Omega_ref_x,'b--', 'LineWidth',2)
plot(log.Controller_Time_s,log.Omega_x,'k-', 'LineWidth',2)
quad_biplane_plotter(log.is_biplane, log.Controller_Time_s, ...
                     [log.Omega_ref_x; ...
                     log.Omega_x]);
hold off
l= legend('$$\omega_{\rm cmd,x}(t)$$','$$\omega_{\rm ref,x}(t)$$','$$\omega_{\rm x}(t)$$','Quad','Biplane');
set(l,'interpreter','latex','fontsize',15);
ylabel('[rad/s]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,2)
plot(log.Controller_Time_s,log.omega_cmd_rot_y,'r-.',  'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.Omega_ref_y,'b--', 'LineWidth',2)
plot(log.Controller_Time_s,log.Omega_y,'k-', 'LineWidth',2)
quad_biplane_plotter(log.is_biplane, log.Controller_Time_s, ...
                     [log.Omega_ref_y; ...
                     log.Omega_y]);
hold off
l= legend('$$\omega_{\rm cmd,y}(t)$$','$$\omega_{\rm ref,y}(t)$$','$$\omega_{\rm y}(t)$$','Quad','Biplane');
set(l,'interpreter','latex','fontsize',15);
ylabel('[rad/s]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,3)
plot(log.Controller_Time_s,log.omega_cmd_rot_z,'r-.',  'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.Omega_ref_z,'b--', 'LineWidth',2)
plot(log.Controller_Time_s,log.Omega_z,'k-', 'LineWidth',2)
quad_biplane_plotter(log.is_biplane, log.Controller_Time_s, ...
                     [log.Omega_ref_z; ...
                     log.Omega_z]);
hold off
l= legend('$$\omega_{\rm cmd,z}(t)$$','$$\omega_{\rm ref,z}(t)$$','$$\omega_{\rm z}(t)$$','Quad','Biplane');
set(l,'interpreter','latex','fontsize',15);
ylabel('[rad/s]','interpreter','latex','fontsize',20)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle('Euler Rates','Interpreter','latex','FontSize',20);

%% Inner loop e_omega
set(figure,'Color','White')
plot(log.Controller_Time_s,log.e_omega_x, 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.e_omega_y, 'LineWidth',2)
plot(log.Controller_Time_s,log.e_omega_z, 'LineWidth',2)
quad_biplane_plotter(log.is_biplane, log.Controller_Time_s, ...
                     [log.e_omega_x; ...
                      log.e_omega_y; ...
                      log.e_omega_z]);
hold off
l= legend('$$e_{\omega,x}(t)$$','$$e_{\omega,y}(t)$$','$$e_{\omega,z}(t)$$','Quad','Biplane');
set(l,'interpreter','latex','fontsize',15);
ylabel('[rad/s]','interpreter','latex','fontsize',20)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle('Error in Angular Velocity','Interpreter','latex','FontSize',20);

%% Inner loop Anguler velocities dot
set(figure,'Color','white')
subplot(3,1,1)
plot(log.Controller_Time_s,log.Omega_ref_dot_x,'b--','LineWidth',2)
hold on
quad_biplane_plotter(log.is_biplane, log.Controller_Time_s,log.Omega_ref_dot_x);
hold off
l= legend('$$\dot{\omega}_{\rm ref,x}(t)$$','Quad','Biplane');
set(l,'interpreter','latex','fontsize',15);
ylabel('[rad/s$$^2$$]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,2)
plot(log.Controller_Time_s,log.Omega_ref_dot_y,'b--','LineWidth',2)
hold on
quad_biplane_plotter(log.is_biplane, log.Controller_Time_s,log.Omega_ref_dot_y);
hold off
l= legend('$$\dot{\omega}_{\rm ref,y}(t)$$','Quad','Biplane');
set(l,'interpreter','latex','fontsize',15);
ylabel('[rad/s$$^2$$]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,3)
plot(log.Controller_Time_s,log.Omega_ref_dot_z,'b--','LineWidth',2)
hold on
quad_biplane_plotter(log.is_biplane, log.Controller_Time_s,log.Omega_ref_dot_z);
hold off
l= legend('$$\dot{\omega}_{\rm ref,z}(t)$$','Quad','Biplane');
set(l,'interpreter','latex','fontsize',15);
ylabel('[rad/s$$^2$$]','interpreter','latex','fontsize',20)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle('Omega Ref Dot','Interpreter','latex','FontSize',20);

%% Inner loop Omega_cmd
set(figure,'Color','White')
plot(log.Controller_Time_s,log.omega_cmd_rot_x, 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.omega_cmd_rot_y, 'LineWidth',2)
plot(log.Controller_Time_s,log.omega_cmd_rot_z, 'LineWidth',2)
quad_biplane_plotter(log.is_biplane, log.Controller_Time_s, ...
                     [log.omega_cmd_rot_x; ...
                     log.omega_cmd_rot_y; ...
                     log.omega_cmd_rot_z]);
hold off
l= legend('$$\omega_{\rm cmd, x}(t)$$','$$\omega_{\rm cmd, y}(t)$$','$$\omega_{\rm cmd, z}(t)$$','Quad','Biplane');
set(l,'interpreter','latex','fontsize',15);
ylabel('[-]','interpreter','latex','fontsize',20)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle('Rotational $$\omega_{\rm cmd}$$','Interpreter','latex','FontSize',20);

%% Inner loop Omega_ref_errors
set(figure,'Color','white')
subplot(2,1,1)
plot(log.Controller_Time_s,log.Reference_Error_omega_x, 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.Reference_Error_omega_y, 'LineWidth',2)  
plot(log.Controller_Time_s,log.Reference_Error_omega_z, 'LineWidth',2)
quad_biplane_plotter(log.is_biplane, log.Controller_Time_s, ...
                     [log.Reference_Error_omega_x; ...
                     log.Reference_Error_omega_y; ...
                     log.Reference_Error_omega_z]);
hold off
l= legend('$$e_{\omega,x_{\rm ref}}(t)$$', ...
          '$$e_{\omega,y_{\rm ref}}(t)$$', ...
          '$$e_{\omega,z_{\rm ref}}(t)$$', ...
          'Quad', 'Biplane');
set(l,'interpreter','latex','fontsize',15);
ylabel('[rad/s]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(2,1,2)
plot(log.Controller_Time_s,log.Integral_Reference_Error_omega_x, 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.Integral_Reference_Error_omega_y, 'LineWidth',2)
plot(log.Controller_Time_s,log.Integral_Reference_Error_omega_z, 'LineWidth',2)
quad_biplane_plotter(log.is_biplane, log.Controller_Time_s, ...
                     [log.Integral_Reference_Error_omega_x; ...
                     log.Integral_Reference_Error_omega_y; ...
                     log.Integral_Reference_Error_omega_z]);
hold off
l= legend('$$\int e_{\omega,x_{\rm ref}}(t)$$', ...
          '$$\int e_{\omega,y_{\rm ref}}(t)$$', ...
          '$$\int e_{\omega,z_{\rm ref}}(t)$$', ...
          'Quad', 'Biplane');
set(l,'interpreter','latex','fontsize',15);
ylabel('[-]','interpreter','latex','fontsize',20)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle('Rotational Reference Errors','Interpreter','latex','FontSize',20);


%% Rotational Inner loop controls
set(figure,'Color','white')
subplot(3,1,1)
plot(log.Controller_Time_s,log.Tau_baseline_x, 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.Tau_baseline_y, 'LineWidth',2)  
plot(log.Controller_Time_s,log.Tau_baseline_z, 'LineWidth',2)
quad_biplane_plotter(log.is_biplane, log.Controller_Time_s, ...
                     [log.Tau_baseline_x; ...
                     log.Tau_baseline_y; ...
                     log.Tau_baseline_z]);
hold off
l= legend('$$\tau_{\rm x,baseline}(t)$$', ...
          '$$\tau_{\rm y,baseline}(t)$$', ...
          '$$\tau_{\rm z,baseline}(t)$$', ...
          'Quad', 'Biplane');
set(l,'interpreter','latex','fontsize',15);
ylabel('[Nm]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,2)
plot(log.Controller_Time_s,log.Tau_adaptive_x, 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.Tau_adaptive_y, 'LineWidth',2)
plot(log.Controller_Time_s,log.Tau_adaptive_z, 'LineWidth',2)
quad_biplane_plotter(log.is_biplane, log.Controller_Time_s, ...
                     [log.Tau_adaptive_x; ...
                     log.Tau_adaptive_y; ...
                     log.Tau_adaptive_z]);
hold off
l= legend('$$\tau_{\rm x,adaptive}(t)$$', ...
          '$$\tau_{\rm y,adaptive}(t)$$', ...
          '$$\tau_{\rm z,adaptive}(t)$$', ...
          'Quad','Biplane');
set(l,'interpreter','latex','fontsize',15);
ylabel('[Nm]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,3)
plot(log.Controller_Time_s,log.Control_input_u2_Nm, 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.Control_input_u3_Nm, 'LineWidth',2)
plot(log.Controller_Time_s,log.Control_input_u4_Nm, 'LineWidth',2)
quad_biplane_plotter(log.is_biplane, log.Controller_Time_s, ...
                     [log.Control_input_u2_Nm; ...
                     log.Control_input_u3_Nm; ...
                     log.Control_input_u4_Nm]);
hold off
l= legend('$$\tau_{\rm x}(t)$$', ...
          '$$\tau_{\rm y}(t)$$', ...
          '$$\tau_{\rm z}(t)$$', ...
          'Quad','Biplane');
set(l,'interpreter','latex','fontsize',15);
ylabel('[Nm]','interpreter','latex','fontsize',20)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle('Rotational Moments','Interpreter','latex','FontSize',20);

%% Total Thrust in N
set(figure,'Color','White')
plot(log.Controller_Time_s,log.Control_input_u1_N, 'LineWidth',2)
hold on
quad_biplane_plotter(log.is_biplane, log.Controller_Time_s,log.Control_input_u1_N);
l= legend('$$u_{1}(t)$$','Quad','Biplane');
set(l,'interpreter','latex','fontsize',15);
ylabel('[N]','interpreter','latex','fontsize',20)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle('Total Thrust in N','Interpreter','latex','FontSize',20);

%% Thrust Inputs for individual motors
set(figure,'Color','White')
subplot(2,1,1)
plot(log.Controller_Time_s,log.Thrust_Motor_1_N, 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.Thrust_Motor_2_N, 'LineWidth',2)
plot(log.Controller_Time_s,log.Thrust_Motor_3_N, 'LineWidth',2)
plot(log.Controller_Time_s,log.Thrust_Motor_4_N, 'LineWidth',2)
quad_biplane_plotter(log.is_biplane, log.Controller_Time_s, ...
                     [log.Thrust_Motor_1_N; ...
                      log.Thrust_Motor_2_N; ...
                      log.Thrust_Motor_3_N; ...
                      log.Thrust_Motor_4_N]);
hold off
l= legend('$$T_{1}(t)$$','$$T_{2}(t)$$','$$T_{3}(t)$$','$$T_{4}(t)$$','Quad','Biplane');
set(l,'interpreter','latex','fontsize',15);
ylabel('[N]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(2,1,2)
plot(log.Controller_Time_s,log.Thrust_Motor_1_Normalized_N, 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.Thrust_Motor_2_Normalized_N, 'LineWidth',2)
plot(log.Controller_Time_s,log.Thrust_Motor_3_Normalized_N, 'LineWidth',2)
plot(log.Controller_Time_s,log.Thrust_Motor_4_Normalized_N, 'LineWidth',2)
quad_biplane_plotter(log.is_biplane, log.Controller_Time_s, ...
                     [log.Thrust_Motor_1_Normalized_N; ...
                      log.Thrust_Motor_2_Normalized_N; ...
                      log.Thrust_Motor_3_Normalized_N; ...
                      log.Thrust_Motor_4_Normalized_N]);
hold off
l= legend('$$T_{1}(t)$$','$$T_{2}(t)$$','$$T_{3}(t)$$','$$T_{4}(t)$$','Quad','Biplane');
set(l,'interpreter','latex','fontsize',15);
ylabel('[-]','interpreter','latex','fontsize',20)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle('Individual Thrust Inputs','Interpreter','latex','FontSize',20);

%% Total Execution Time 
set(figure,'Color','White')
plot(log.Controller_Time_s,log.Alg_exe_time, '*', 'LineWidth',2)
hold on
% Plot the average execution time
plot(log.Controller_Time_s,der.average_algorithm_execution_time_us ...
    * ones(size(log.Controller_Time_s)),'--','LineWidth',2)
% Plot standard deviation band
std_upper = der.average_algorithm_execution_time_us + der.standard_deviation_algorithm_execution_time_us;
std_lower = der.average_algorithm_execution_time_us - der.standard_deviation_algorithm_execution_time_us;
fill([log.Controller_Time_s(1), log.Controller_Time_s(end), log.Controller_Time_s(end), log.Controller_Time_s(1)], ...
    [std_lower, std_lower, std_upper, std_upper], ...
    'r', 'EdgeColor', 'none', 'FaceAlpha', 0.3);
l = legend('', ['Average execution time: ', num2str(der.average_algorithm_execution_time_us), ' $\mu$s'], ...
           ['$\pm$ Standard deviation: ', num2str(der.standard_deviation_algorithm_execution_time_us), ' $\mu$s']);
set(l,'interpreter','latex','fontsize',15);
ylabel('[$$\mu$s]','interpreter','latex','fontsize',20)
axis tight
hold off
% ylim([300, 600])
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle('Algorithm Execution Time','Interpreter','latex','FontSize',20);

%% Contribution of PID tran
set(figure,'Color','White')
subplot(3,1,1)
plot(log.Controller_Time_s,der.Kp_tran_contrib(1,:)', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,der.Kd_tran_contrib(1,:)', 'LineWidth',2)
plot(log.Controller_Time_s,der.Ki_tran_contrib(1,:)', 'LineWidth',2)
plot(log.Controller_Time_s,der.Tran_baseline_Total(1,:)', 'LineWidth',2)
hold off
l= legend('$$K_{p,x}(t)$$ contrib','$$K_{d,x}(t)$$ contrib','$$K_{i,x}(t)$$ contrib', 'Sum(t)');
set(l,'interpreter','latex','fontsize',15);
ylabel('[N]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,2)
plot(log.Controller_Time_s,der.Kp_tran_contrib(2,:)', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,der.Kd_tran_contrib(2,:)', 'LineWidth',2)
plot(log.Controller_Time_s,der.Ki_tran_contrib(2,:)', 'LineWidth',2)
plot(log.Controller_Time_s,der.Tran_baseline_Total(2,:)', 'LineWidth',2)
hold off
l= legend('$$K_{p,y}(t)$$ contrib','$$K_{d,y}(t)$$ contrib','$$K_{i,y}(t)$$ contrib', 'Sum(t)');
set(l,'interpreter','latex','fontsize',15);
ylabel('[N]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,3)
plot(log.Controller_Time_s,der.Kp_tran_contrib(3,:)', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,der.Kd_tran_contrib(3,:)', 'LineWidth',2)
plot(log.Controller_Time_s,der.Ki_tran_contrib(3,:)', 'LineWidth',2)
plot(log.Controller_Time_s,der.Tran_baseline_Total(3,:)', 'LineWidth',2)
hold off
l= legend('$$K_{p,z}(t)$$ contrib','$$K_{d,z}(t)$$ contrib','$$K_{i,z}(t)$$ contrib', 'Sum(t)');
set(l,'interpreter','latex','fontsize',15);
ylabel('[N]','interpreter','latex','fontsize',20)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle('Translational Baseline Contributions','Interpreter','latex','FontSize',20);

%% Contribution of PID rot
set(figure,'Color','White')
subplot(3,1,1)
plot(log.Controller_Time_s,der.Kp_rot_contrib(1,:)', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,der.Kd_rot_contrib(1,:)', 'LineWidth',2)
plot(log.Controller_Time_s,der.Ki_rot_contrib(1,:)', 'LineWidth',2)
plot(log.Controller_Time_s,der.Rot_baseline_Total(1,:)', 'LineWidth',2)
hold off
l= legend('$$K_{p,\phi}(t)$$ contrib','$$K_{d,\phi}(t)$$ contrib','$$K_{i,\phi}(t)$$ contrib', 'Sum(t)');
set(l,'interpreter','latex','fontsize',15);
ylabel('[Nm]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,2)
plot(log.Controller_Time_s,der.Kp_rot_contrib(2,:)', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,der.Kd_rot_contrib(2,:)', 'LineWidth',2)
plot(log.Controller_Time_s,der.Ki_rot_contrib(2,:)', 'LineWidth',2)
plot(log.Controller_Time_s,der.Rot_baseline_Total(2,:)', 'LineWidth',2)
hold off
l= legend('$$K_{p,\theta}(t)$$ contrib','$$K_{d,\theta}(t)$$ contrib','$$K_{i,\theta}(t)$$ contrib', 'Sum(t)');
set(l,'interpreter','latex','fontsize',15);
ylabel('[Nm]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,3)
plot(log.Controller_Time_s,der.Kp_rot_contrib(3,:)', 'LineWidth',2)
hold on
plot(log.Controller_Time_s,der.Kd_rot_contrib(3,:)', 'LineWidth',2)
plot(log.Controller_Time_s,der.Ki_rot_contrib(3,:)', 'LineWidth',2)
plot(log.Controller_Time_s,der.Rot_baseline_Total(3,:)', 'LineWidth',2)
hold off
l= legend('$$K_{p,\psi}(t)$$ contrib','$$K_{d,\psi}(t)$$ contrib','$$K_{i,\psi}(t)$$ contrib', 'Sum(t)');
set(l,'interpreter','latex','fontsize',15);
ylabel('[Nm]','interpreter','latex','fontsize',20)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle('Rotational Baseline Contributions','Interpreter','latex','FontSize',20);

%% ////////////////////////////////////////////////////////////////////////
% =========================================================================
% AERODYNAMICS STUFF
% =========================================================================

%% Plot the coefficients of Lift, Drag and Moment
plotAeroCoeff(log,'MRAC - Estimated Aerodynamic Coefficients');

%% Plot the squared norm of the body velocities
plotSqNormVel(log, 'MRAC - Squared Norm of Body Velocities');

%% Plot the outerloop and inner loop dynamic inversion terms
plotAeroDynInv(log, 'MRAC - Aero Dynamic Inversion');

%% ////////////////////////////////////////////////////////////////////////
% =========================================================================
% MOCAP STUFF
% =========================================================================
%% Plot mocap time vs x,y,z
plotMOCAPPosition(log, mocap, 'MRAC - Mocap Position');
    
%% Plot mocap time vs phi,theta,psi
plotMOCAPEulerAngles(log, mocap, 'MRAC - Mocap Orientation');

%% ////////////////////////////////////////////////////////////////////////
% =========================================================================
% VIO STUFF
% =========================================================================
%% Plot vio time vs x,y,z
plotVIOPosition(log, vio, 'MRAC - VIO Position');

%% Plot vio time vs phi,theta,psi
plotVIOEulerAngles(log, vio, 'MRAC - VIO Orientation');

%% Plot vio time vs vx, vy, vz
plotVIOVelocity(log, vio, 'MRAC - VIO Velocity');

%% Plot vio time vs wx, wy, wz
plotVIOAngularVelocity(log, vio, 'MRAC - VIO Angular Velocity');

%% ////////////////////////////////////////////////////////////////////////
% =========================================================================
% VIO AND MOCAP STUFF
% =========================================================================
%% Plot mocap,vio,controller for x,y,z
plotMOCAPVIOPosition(log,mocap,vio,'MRAC - Mocap and VIO Position');

%% Plot mocap,vio,controller for phi,theta,psi
plotMOCAPVIOEulerAngles(log,mocap,vio,'MRAC - Mocap and VIO Orientation');