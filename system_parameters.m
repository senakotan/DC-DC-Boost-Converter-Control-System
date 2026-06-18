%% PI 
clear
clc
clear all
Vin=12; D=0.5; L=1e-3; C=470e-6; R=10;
num = [Vin/(1-D)^2 * (-L/(R*(1-D)^2)), Vin/(1-D)^2];
den = [L*C/(1-D)^2, L/(R*(1-D)^2), 1];
Gvd = tf(num, den);
C_pi = pidtune(Gvd, 'PI')

%% PID 

Vin=12; D=0.5; L=1e-3; C=470e-6; R=10;
num = [Vin/(1-D)^2 * (-L/(R*(1-D)^2)), Vin/(1-D)^2];
den = [L*C/(1-D)^2, L/(R*(1-D)^2), 1];
Gvd = tf(num, den);

C_pid = pidtune(Gvd, 'PID')
Kp = C_pid.Kp
Ki = C_pid.Ki
Kd = C_pid.Kd


%% PD 

C_pd = pidtune(Gvd, 'PD')
Kp_pd = C_pd.Kp
Kd_pd = C_pd.Kd


C_pd = pidtune(Gvd, 'PD');
Kp_pd = C_pd.Kp
Kd_pd = C_pd.Kd

Kp_pd = 0.5
Kd_pd = C_pd.Kd

%% PID 

C_pid = pidtune(Gvd, 'PID');
Kp_pid = C_pid.Kp
Ki_pid = C_pid.Ki  
Kd_pid = C_pid.Kd


%% FAZ ILERI

z = 100; p = 1000; K = 5;
C_lead = tf(K*[1 z], [1 p]);
[num_lead, den_lead] = tfdata(C_lead, 'v')

z = 10; p = 100; K = 0.5;
C_lead = tf(K*[1 z], [1 p]);
[num_lead, den_lead] = tfdata(C_lead, 'v')


z = 1; p = 10; K = 0.05;
C_lead = tf(K*[1 z], [1 p]);
[num_lead, den_lead] = tfdata(C_lead, 'v')

%% FAZ GERI 

z = 1; p = 0.1; K = 0.05;
C_lag = tf(K*[1 z], [1 p]);
[num_lag, den_lag] = tfdata(C_lag, 'v')

z = 1; p = 0.1; K = 0.005;
C_lag = tf(K*[1 z], [1 p]);
[num_lag, den_lag] = tfdata(C_lag, 'v')