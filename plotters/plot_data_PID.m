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
set(groot, 'defaultAxesFontSize', 30); % Increase axis font size
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Giri Mugundan Kumar
% Department of Mechanical Engineering
% Virginia Tech
% 05/22/2024
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Plot the translational command, reference and states.
set(figure,'Color','white')
subplot(3,1,1)
plot(log.Controller_Time_s,log.User_Position_x_m,'r-.','LineWidth',2)
hold on
plot(log.Controller_Time_s,log.Position_x_m,'k-','LineWidth',2)
hold off
l= legend('$$x_{\rm cmd}(t)$$','$$x(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[m]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,2)
plot(log.Controller_Time_s,log.User_Position_y_m,'r-.','LineWidth',2)
hold on
plot(log.Controller_Time_s,log.Position_y_m,'k-','LineWidth',2)
hold off
l= legend('$$y_{\rm cmd}(t)$$','$$y(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[m]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,3)
plot(log.Controller_Time_s,log.User_Position_z_m,'r-.','LineWidth',2)
hold on
plot(log.Controller_Time_s,log.Position_z_m,'k-','LineWidth',2)
hold off
l= legend('$$z_{\rm cmd}(t)$$','$$z(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[m]','interpreter','latex','fontsize',20)
axis tight
ax = gca;
ax.YDir = 'reverse';
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle('Translational Position','Interpreter','latex','FontSize',20);

%% Plot the translational velocity command, reference and states.
set(figure,'Color','white')
subplot(3,1,1)
plot(log.Controller_Time_s,log.User_Velocity_x_ms,'r-.','LineWidth',2)
hold on
plot(log.Controller_Time_s,log.Velocity_x_ms,'k-','LineWidth',2)
hold off
l= legend('$$\dot{x}_{\rm cmd}(t)$$','$$\dot{x}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[m/s]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,2)
plot(log.Controller_Time_s,log.User_Velocity_y_ms,'r-.','LineWidth',2)
hold on
plot(log.Controller_Time_s,log.Velocity_y_ms,'k-','LineWidth',2)
hold off
l= legend('$$\dot{y}_{\rm cmd}(t)$$','$$\dot{y}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[m/s]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,3)
plot(log.Controller_Time_s,log.User_Velocity_z_ms,'r-.','LineWidth',2)
hold on
plot(log.Controller_Time_s,log.Velocity_z_ms,'k-','LineWidth',2)
hold off
l= legend('$$\dot{z}_{\rm cmd}(t)$$','$$\dot{z}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[m/s]','interpreter','latex','fontsize',20)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle('Translational Velocity','Interpreter','latex','FontSize',20);

%% Plot the errors in the translational outer loop
set(figure, 'Color', 'white')
subplot(2,1,1)
plot(log.Controller_Time_s, log.Error_in_position_x_m, 'LineWidth', 2)
hold on
plot(log.Controller_Time_s, log.Error_in_position_y_m, 'LineWidth', 2)
plot(log.Controller_Time_s, log.Error_in_position_z_m, 'LineWidth', 2)
hold off
l= legend('$$e_{\rm x}(t)$$','$$e_{\rm y}(t)$$','$$e_{\rm z}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[m]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(2,1,2)
plot(log.Controller_Time_s, log.Error_in_velocity_x_ms, 'LineWidth', 2)
hold on
plot(log.Controller_Time_s, log.Error_in_velocity_y_ms, 'LineWidth', 2)
plot(log.Controller_Time_s, log.Error_in_velocity_z_ms, 'LineWidth', 2)
hold off
l= legend('$$e_{\rm vx}(t)$$','$$e_{\rm vy}(t)$$','$$e_{\rm vz}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[m/s]','interpreter','latex','fontsize',20)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle('Translational State Errors','Interpreter','latex','FontSize',20);

%% Integral Error in Position
set(figure,'Color','White')
plot(log.Controller_Time_s,log.Integral_Error_in_x_m, 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.Integral_Error_in_y_m, 'LineWidth',2)
plot(log.Controller_Time_s,log.Integral_Error_in_z_m, 'LineWidth',2)
hold off
l= legend('$$\int e_{\rm x}(t)$$','$$\int e_{\rm y}(t)$$','$$\int e_{\rm z}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[-]','interpreter','latex','fontsize',20)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle('Integral error in Position','Interpreter','latex','FontSize',20);

%% Translational outerloop virtual controls
set(figure,'Color','white')
subplot(2,1,1)
plot(log.Controller_Time_s,log.Virutal_control_mu_in_I_x_N, 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.Virutal_control_mu_in_I_y_N, 'LineWidth',2)  
plot(log.Controller_Time_s,log.Virutal_control_mu_in_I_z_N, 'LineWidth',2)
hold off
l= legend('$$\mu_{\rm x}^{\mathbf{I}}(t)$$','$$\mu_{\rm y}^{\mathbf{I}}(t)$$','$$\mu_{\rm z}^{\mathbf{I}}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[N]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(2,1,2)
plot(log.Controller_Time_s,log.Virtual_control_in_body_x_N, 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.Virtual_control_in_body_y_N, 'LineWidth',2)
plot(log.Controller_Time_s,log.Virtual_control_in_body_z_N, 'LineWidth',2)
hold off
l= legend('$$\mu_{\rm x}^{\mathbf{J}}(t)$$','$$\mu_{\rm y}^{\mathbf{J}}(t)$$','$$\mu_{\rm z}^{\mathbf{J}}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[N]','interpreter','latex','fontsize',20)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle('Translational Virtual Forces','Interpreter','latex','FontSize',20);

%% Euler Angles
set(figure,'Color','white')
subplot(3,1,1)
plot(log.Controller_Time_s,rad2deg(log.Desired_phi_rad), 'LineWidth',2)
hold on
plot(log.Controller_Time_s,rad2deg(log.Angle_roll_rad), 'LineWidth',2)
hold off
l= legend('$$\phi_{\rm desired}(t)$$','$$\phi(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[deg]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,2)
plot(log.Controller_Time_s,rad2deg(log.Desired_theta_rad), 'LineWidth',2)
hold on
plot(log.Controller_Time_s,rad2deg(log.Angle_pitch_rad), 'LineWidth',2)
hold off
l= legend('$$\theta_{\rm desired}(t)$$','$$\theta(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[deg]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,3)
plot(log.Controller_Time_s,rad2deg(log.Desired_psi_rad), 'LineWidth',2)
hold on
plot(log.Controller_Time_s,rad2deg(log.Angle_yaw_rad), 'LineWidth',2)
hold off
l= legend('$$\psi_{\rm desired}(t)$$','$$\psi(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[deg]','interpreter','latex','fontsize',20)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle('Euler Angles','Interpreter','latex','FontSize',20);

%% Euler Angles Rates
set(figure,'Color','white')
subplot(3,1,1)
plot(log.Controller_Time_s,log.Desired_phi_dot_rads, 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.Angular_rates_x_rads, 'LineWidth',2)
hold off
l= legend('$$\dot{\phi}_{\rm desired}(t)$$','$$\dot{\phi}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[rad/s]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,2)
plot(log.Controller_Time_s,log.Desired_theta_dot_rads, 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.Angular_rates_y_rads, 'LineWidth',2)
hold off
l= legend('$$\dot{\theta}_{\rm desired}(t)$$','$$\dot{\theta}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[rad/s]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,3)
plot(log.Controller_Time_s,log.Desired_psi_dot_rads, 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.Angular_rates_z_rads, 'LineWidth',2)
hold off
l= legend('$$\dot{\psi}_{\rm desired}(t)$$','$$\dot{\psi(}t)$$');
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
hold off
l= legend('$$e_{\phi}(t)$$','$$e_{\theta}(t)$$','$$e_{\psi}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[deg]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(2,1,2)
plot(log.Controller_Time_s,rad2deg(log.Error_in_Euler_phi_rate_rads), 'LineWidth',2)
hold on
plot(log.Controller_Time_s,rad2deg(log.Error_in_Euler_theta_rate_rads), 'LineWidth',2)
plot(log.Controller_Time_s,rad2deg(log.Error_in_Euler_psi_rate_rads), 'LineWidth',2)
hold off
l= legend('$$e_{\dot{\phi}}(t)$$','$$e_{\dot{\theta}}(t)$$','$$e_{\dot{\psi}}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[deg/s]','interpreter','latex','fontsize',20)
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
hold off
l= legend('$$\int e_{\phi}(t)$$','$$\int e_{\theta}(t)$$','$$\int e_{\psi}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[-]','interpreter','latex','fontsize',20)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle('Integral error in Euler Angles','Interpreter','latex','FontSize',20);

%% Rotational Inner loop controls
set(figure,'Color','white')
plot(log.Controller_Time_s,log.Control_input_u2_Nm, 'LineWidth',2)
hold on
plot(log.Controller_Time_s,log.Control_input_u3_Nm, 'LineWidth',2)
plot(log.Controller_Time_s,log.Control_input_u4_Nm, 'LineWidth',2)
hold off
l= legend('$$\tau_{\rm x}^{\mathbf{J}}(t)$$','$$\tau_{\rm y}^{\mathbf{J}}(t)$$','$$\tau_{\rm z}^{\mathbf{J}}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[Nm]','interpreter','latex','fontsize',20)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle('Rotational Control Moments','Interpreter','latex','FontSize',20);

%% Total Thrust in N
set(figure,'Color','White')
plot(log.Controller_Time_s,log.Control_input_u1_N, 'LineWidth',2)
l= legend('$$u_{1}(t)$$');
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
hold off
l= legend('$$T_{1}(t)$$','$$T_{2}(t)$$','$$T_{3}(t)$$','$$T_{4}(t)$$');
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
hold off
l= legend('$$T_{1}(t)$$','$$T_{2}(t)$$','$$T_{3}(t)$$','$$T_{4}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[-]','interpreter','latex','fontsize',20)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle('Individual Thrust Inputs','Interpreter','latex','FontSize',20);

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

%% Desired Euler Acceleration
set(figure,'Color','white')
subplot(3,1,1)
plot(log.Controller_Time_s,log.Desired_phi_ddot_rads2, 'LineWidth',2)
l= legend('$$\ddot{\phi}_{\rm desired}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[rad/s$$^2$$]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,2)
plot(log.Controller_Time_s,log.Desired_theta_ddot_rads2, 'LineWidth',2)
l= legend('$$\ddot{\theta}_{\rm desired}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[rad/s$$^2$$]','interpreter','latex','fontsize',20)
axis tight
grid minor

subplot(3,1,3)
plot(log.Controller_Time_s,log.Desired_psi_ddot_rads2, 'LineWidth',2)
l= legend('$$\ddot{\psi}_{\rm desired}(t)$$');
set(l,'interpreter','latex','fontsize',15);
ylabel('[rad/s$$^2$$]','interpreter','latex','fontsize',20)
axis tight
grid minor
xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
sgtitle('Desired Euler Acceleration','Interpreter','latex','FontSize',20);

%%
% =========================================================================
% MOCAP STUFF
% =========================================================================

if (~der.not_flying_mocap && der.not_flying_vio)
    %% Plot mocap time vs x,y,z
    set(figure,'Color','white')
    subplot(3,1,1)
    plot(log.Controller_Time_s,log.Position_x_m,'b-.','LineWidth',2)
    hold on
    plot(mocap.Mocap_time_s,mocap.x,'r--', 'LineWidth',2)
    hold off
    l= legend('$$x(t)$$','$$x_{\rm mocap}(t)$$');
    set(l,'interpreter','latex','fontsize',15);
    ylabel('[m]','interpreter','latex','fontsize',20)
    axis tight
    grid minor
    
    subplot(3,1,2)
    plot(log.Controller_Time_s,log.Position_y_m,'b-.','LineWidth',2)
    hold on
    plot(mocap.Mocap_time_s,mocap.y,'r--', 'LineWidth',2)
    hold off
    l= legend('$$y(t)$$','$$y_{\rm mocap}(t)$$');
    set(l,'interpreter','latex','fontsize',15);
    ylabel('[m]','interpreter','latex','fontsize',20)
    axis tight
    grid minor
    
    subplot(3,1,3)
    plot(log.Controller_Time_s,log.Position_z_m,'b-.','LineWidth',2)
    hold on
    plot(mocap.Mocap_time_s,mocap.z,'r--', 'LineWidth',2)
    hold off
    l= legend('$$z(t)$$','$$z_{\rm mocap}(t)$$');
    set(l,'interpreter','latex','fontsize',15);
    ylabel('[m]','interpreter','latex','fontsize',20)
    axis tight
    grid minor
    ax = gca;
    ax.YDir = 'reverse';
    xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
    sgtitle('Mocap Position','Interpreter','latex','FontSize',20);
    
    %% Plot mocap time vs phi,theta,psi
    set(figure,'Color','white')
    subplot(3,1,1)
    plot(log.Controller_Time_s,rad2deg(log.Angle_roll_rad),'b-.','LineWidth',2)
    hold on
    plot(mocap.Mocap_time_s,rad2deg(mocap.roll),'r--', 'LineWidth',2)
    hold off
    l= legend('$$\phi(t)$$','$$\phi_{\rm mocap}(t)$$');
    set(l,'interpreter','latex','fontsize',15);
    ylabel('[deg]','interpreter','latex','fontsize',20)
    axis tight
    grid minor
    
    subplot(3,1,2)
    plot(log.Controller_Time_s,rad2deg(log.Angle_pitch_rad),'b-.','LineWidth',2)
    hold on
    plot(mocap.Mocap_time_s,rad2deg(mocap.pitch),'r--', 'LineWidth',2)
    hold off
    l= legend('$$\theta(t)$$','$$\theta_{\rm mocap}(t)$$');
    set(l,'interpreter','latex','fontsize',15);
    ylabel('[deg]','interpreter','latex','fontsize',20)
    axis tight
    grid minor
    
    subplot(3,1,3)
    plot(log.Controller_Time_s,rad2deg(log.Angle_yaw_rad),'b-.','LineWidth',2)
    hold on
    plot(mocap.Mocap_time_s,rad2deg(mocap.yaw),'r--', 'LineWidth',2)
    hold off
    l= legend('$$\psi(t)$$','$$\psi_{\rm mocap}(t)$$');
    set(l,'interpreter','latex','fontsize',15);
    ylabel('[deg]','interpreter','latex','fontsize',20)
    axis tight
    grid minor
    ax = gca;
    ax.YDir = 'reverse';
    xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
    sgtitle('Mocap Orientation','Interpreter','latex','FontSize',20);
end


%%
% =========================================================================
% VIO STUFF
% =========================================================================
if (~der.not_flying_vio && der.not_flying_mocap)
    %% Plot vio time vs x,y,z
    set(figure,'Color','white')
    subplot(3,1,1)
    plot(log.Controller_Time_s,log.Position_x_m,'b-.','LineWidth',2)
    hold on
    plot(vio.controller_time_s,vio.x,'r--', 'LineWidth',2)
    hold off
    l= legend('$$x(t)$$','$$x_{\rm vio}(t)$$');
    set(l,'interpreter','latex','fontsize',15);
    ylabel('[m]','interpreter','latex','fontsize',20)
    axis tight
    grid minor
    
    subplot(3,1,2)
    plot(log.Controller_Time_s,log.Position_y_m,'b-.','LineWidth',2)
    hold on
    plot(vio.controller_time_s,vio.y,'r--', 'LineWidth',2)
    hold off
    l= legend('$$y(t)$$','$$y_{\rm vio}(t)$$');
    set(l,'interpreter','latex','fontsize',15);
    ylabel('[m]','interpreter','latex','fontsize',20)
    axis tight
    grid minor
    
    subplot(3,1,3)
    plot(log.Controller_Time_s,log.Position_z_m,'b-.','LineWidth',2)
    hold on
    plot(vio.controller_time_s,vio.z,'r--', 'LineWidth',2)
    hold off
    l= legend('$$z(t)$$','$$z_{\rm vio}(t)$$');
    set(l,'interpreter','latex','fontsize',15);
    ylabel('[m]','interpreter','latex','fontsize',20)
    axis tight
    grid minor
    ax = gca;
    ax.YDir = 'reverse';
    xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
    sgtitle('VIO Position','Interpreter','latex','FontSize',20);
    
    %% Plot vio time vs phi,theta,psi
    set(figure,'Color','white')
    subplot(3,1,1)
    plot(log.Controller_Time_s,rad2deg(log.Angle_roll_rad),'b-.','LineWidth',2)
    hold on
    plot(vio.controller_time_s,rad2deg(vio.roll),'r--', 'LineWidth',2)
    hold off
    l= legend('$$\phi(t)$$','$$\phi_{\rm vio}(t)$$');
    set(l,'interpreter','latex','fontsize',15);
    ylabel('[deg]','interpreter','latex','fontsize',20)
    axis tight
    grid minor
    
    subplot(3,1,2)
    plot(log.Controller_Time_s,rad2deg(log.Angle_pitch_rad),'b-.','LineWidth',2)
    hold on
    plot(vio.controller_time_s,rad2deg(vio.pitch),'r--', 'LineWidth',2)
    hold off
    l= legend('$$\theta(t)$$','$$\theta_{\rm vio}(t)$$');
    set(l,'interpreter','latex','fontsize',15);
    ylabel('[deg]','interpreter','latex','fontsize',20)
    axis tight
    grid minor
    
    subplot(3,1,3)
    plot(log.Controller_Time_s,rad2deg(log.Angle_yaw_rad),'b-.','LineWidth',2)
    hold on
    plot(vio.controller_time_s,rad2deg(vio.yaw),'r--', 'LineWidth',2)
    hold off
    l= legend('$$\psi(t)$$','$$\psi_{\rm vio}(t)$$');
    set(l,'interpreter','latex','fontsize',15);
    ylabel('[deg]','interpreter','latex','fontsize',20)
    axis tight
    grid minor
    ax = gca;
    ax.YDir = 'reverse';
    xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
    sgtitle('VIO Orientation','Interpreter','latex','FontSize',20);
end

%%
% =========================================================================
% VIO AND MOCAP STUFF
% =========================================================================
if (~der.not_flying_mocap && ~der.not_flying_vio)
    %% Plot mocap,vio,controller for x,y,z
    set(figure,'Color','white')
    subplot(3,1,1)
    plot(log.Controller_Time_s,log.Position_x_m,'k-','LineWidth',2)
    hold on
    plot(mocap.Mocap_time_s,mocap.x,'r--', 'LineWidth',2)
    plot(vio.controller_time_s,vio.x,'b-.', 'LineWidth',2)
    hold off
    l= legend('$$x(t)$$','$$x_{\rm mocap}(t)$$', '$$x_{\rm vio}(t)$$');
    set(l,'interpreter','latex','fontsize',15);
    ylabel('[m]','interpreter','latex','fontsize',20)
    axis tight
    grid minor
    
    subplot(3,1,2)
    plot(log.Controller_Time_s,log.Position_y_m,'k-','LineWidth',2)
    hold on
    plot(mocap.Mocap_time_s,mocap.y,'r--', 'LineWidth',2)
    plot(vio.controller_time_s,vio.y,'b-.','LineWidth',2)
    hold off
    l= legend('$$y(t)$$','$$y_{\rm mocap}(t)$$', '$$y_{\rm vio}(t)$$');
    set(l,'interpreter','latex','fontsize',15);
    ylabel('[m]','interpreter','latex','fontsize',20)
    axis tight
    grid minor
    
    subplot(3,1,3)
    plot(log.Controller_Time_s,log.Position_z_m,'k-','LineWidth',2)
    hold on
    plot(mocap.Mocap_time_s,mocap.z,'r--', 'LineWidth',2)
    plot(vio.controller_time_s,vio.z,'b-.', 'LineWidth',2)
    hold off
    l= legend('$$z(t)$$','$$z_{\rm mocap}(t)$$','$$z_{\rm vio}(t)$$');
    set(l,'interpreter','latex','fontsize',15);
    ylabel('[m]','interpreter','latex','fontsize',20)
    axis tight
    grid minor
    ax = gca;
    ax.YDir = 'reverse';
    xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
    sgtitle('Mocap and VIO Position','Interpreter','latex','FontSize',20);

    %% Plot the velocity (VIO and controller)
    set(figure,'Color','white')
    subplot(3,1,1)
    plot(log.Controller_Time_s,log.Velocity_x_ms,'k-','LineWidth',2)
    hold on
    plot(vio.controller_time_s,vio.vx,'b-.','LineWidth',2)
    hold off
    l= legend('$$\dot{x}(t)$$', '$$\dot{x}_{\rm vio}(t)$$');
    set(l,'interpreter','latex','fontsize',15);
    ylabel('[m/s]','interpreter','latex','fontsize',20)
    axis tight
    grid minor
    
    subplot(3,1,2)
    plot(log.Controller_Time_s,log.Velocity_y_ms,'k-','LineWidth',2)
    hold on
    plot(vio.controller_time_s,vio.vy,'b-.','LineWidth',2)
    hold off
    l= legend('$$\dot{y}(t)$$', '$$\dot{y}_{\rm vio}(t)$$');
    set(l,'interpreter','latex','fontsize',15);
    ylabel('[m/s]','interpreter','latex','fontsize',20)
    axis tight
    grid minor
    
    subplot(3,1,3)
    plot(log.Controller_Time_s,log.Velocity_z_ms,'k-','LineWidth',2)
    hold on
    plot(vio.controller_time_s,vio.vz,'b-.','LineWidth',2)
    hold off
    l= legend('$$\dot{z}(t)$$', '$$\dot{z}_{\rm vio}(t)$$');
    set(l,'interpreter','latex','fontsize',15);
    ylabel('[m/s]','interpreter','latex','fontsize',20)
    axis tight
    grid minor
    ax = gca;
    ax.YDir = 'reverse';
    xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
    sgtitle('VIO Velocity','Interpreter','latex','FontSize',20);
    
    %% Plot mocap,vio,controller for phi,theta,psi
    set(figure,'Color','white')
    subplot(3,1,1)
    plot(log.Controller_Time_s,rad2deg(log.Angle_roll_rad),'k-','LineWidth',2)
    hold on
    plot(mocap.Mocap_time_s,rad2deg(mocap.roll),'r--', 'LineWidth',2)
    plot(vio.controller_time_s,rad2deg(vio.roll),'b-.','LineWidth',2)
    hold off
    l= legend('$$\phi(t)$$','$$\phi_{\rm mocap}(t)$$', '$$\phi_{\rm vio}$$');
    set(l,'interpreter','latex','fontsize',15);
    ylabel('[deg]','interpreter','latex','fontsize',20)
    axis tight
    grid minor
    
    subplot(3,1,2)
    plot(log.Controller_Time_s,rad2deg(log.Angle_pitch_rad),'k-','LineWidth',2)
    hold on
    plot(mocap.Mocap_time_s,rad2deg(mocap.pitch),'r--', 'LineWidth',2)
    plot(vio.controller_time_s,rad2deg(vio.pitch),'b-.','LineWidth',2)
    hold off
    l= legend('$$\theta(t)$$','$$\theta_{\rm mocap}(t)$$', '$$\theta_{\rm vio}$$');
    set(l,'interpreter','latex','fontsize',15);
    ylabel('[deg]','interpreter','latex','fontsize',20)
    axis tight
    grid minor
    
    subplot(3,1,3)
    plot(log.Controller_Time_s,rad2deg(log.Angle_yaw_rad),'k-','LineWidth',2)
    hold on
    plot(mocap.Mocap_time_s,rad2deg(mocap.yaw),'r--', 'LineWidth',2)
    plot(vio.controller_time_s,rad2deg(vio.yaw),'b-.','LineWidth',2)
    hold off
    l= legend('$$\psi(t)$$','$$\psi_{\rm mocap}(t)$$', '$$\psi_{\rm vio}$$');
    set(l,'interpreter','latex','fontsize',15);
    ylabel('[deg]','interpreter','latex','fontsize',20)
    axis tight
    grid minor
    ax = gca;
    ax.YDir = 'reverse';
    xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
    sgtitle('Mocap and VIO Orientation','Interpreter','latex','FontSize',20);

    %% Plot the angular velocity (VIO and controller)
    set(figure,'Color','white')
    subplot(3,1,1)
    plot(log.Controller_Time_s,log.omega_x_rads,'k-', 'LineWidth',2)
    hold on
    plot(vio.controller_time_s,vio.rollspeed,'b-.','LineWidth',2)
    hold off
    l= legend('$$\omega_x(t)$$','$$\omega_{x_{\rm vio}}(t)$$');
    set(l,'interpreter','latex','fontsize',15);
    ylabel('[rad/s]','interpreter','latex','fontsize',20)
    axis tight
    grid minor
    
    subplot(3,1,2)
    plot(log.Controller_Time_s,log.omega_y_rads,'k-', 'LineWidth',2)
    hold on
    plot(vio.controller_time_s,vio.pitchspeed,'b-.','LineWidth',2)
    hold off
    l= legend('$$\omega_y(t)$$','$$\omega_{y_{\rm vio}}(t)$$');
    set(l,'interpreter','latex','fontsize',15);
    ylabel('[rad/s]','interpreter','latex','fontsize',20)
    axis tight
    grid minor
    
    subplot(3,1,3)
    plot(log.Controller_Time_s,log.omega_z_rads,'k-', 'LineWidth',2)
    hold on
    plot(vio.controller_time_s,vio.yawspeed,'b-.','LineWidth',2)
    hold off
    l= legend('$$\omega_z(t)$$','$$\omega_{z_{\rm vio}}(t)$$');
    set(l,'interpreter','latex','fontsize',15);
    ylabel('[rads/s]','interpreter','latex','fontsize',20)
    axis tight
    grid minor  
    xlabel('$$t \, {\rm [s]}$$','interpreter','latex','fontsize',20)
    sgtitle('VIO Angular Velocity','Interpreter','latex','FontSize',20);
    
end