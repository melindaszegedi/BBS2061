function dYdt = Model3_reduced(t,Y)
% ODE cancer model, including cancer cells (C), chemotherapy drug (e.g.
% docetaxel) (D), Endothelium (E), VEGF (V), anti-VEGF drug (A) 
%
% input: 
% - t:  time
% - Y:  vector of state variables (C, D, E, V, A)
% - dYdt:   column vector of derivatives

%% Parameters
c_M = 10^4; % mm^3
d_c = 0.103;  % day-1
b = 0.1685; % ml/mg.day
lambda_ce =0.061053; %1/day
d_d = 0.1825; %1/day
b_k = 1.0839*10^-6; % % mg/ml.day.mm^3
E_thres = 4.5; %mm^3
lambda_e = 0.03; % 1/day
E_M = 10; %mm^3
d_e = 0.05; % 1/day
d_v = 0.1; % 1/day
d_b = 0.05; % 1/day
lambda_v0 = 10^-3; % mg/ml.day.mm^3
k = 0.1; % 1/day
mu_B = 10; %ml/day.mg
mu_Bk = 0.15; %ml/day.mg

%% Variables 
C = Y(1); %cancer cells 
D = Y(2); %chemotherapy drug concentration (e.g. docetaxel) 
E = Y(3); %endothelial cell density
V = Y(4); %VEGF concentation
A = Y(5); %anti-VEGF drug concentration
%5 variables -> 5 ODEs 

%% ODEs - still have to adjust after meet the expert session

dCdt = lambda_ce*(C*(1-C/c_M))*(E/E_thres+E)-d_c*C-b*C*D*E;

dDdt = -d_d*D-b_k*C*D*E;

dEdt = lambda_e*E*(1-E/E_M)-d_e*E+k*V*E*(1-E/E_M);

dVdt = lambda_v0*C-d_v*V-mu_B*V*A;

if E < E_thres
    lambda_v0 = 5*10^-4;
else
    lambda_v0 = 10^-4;
end

dAdt = -d_b*A - mu_Bk*V*A;

%create output column vector dYdt
dYdt = [dCdt;  dDdt; dEdt; dVdt; dAdt]; %5 variables -> 5 ODEs

end

