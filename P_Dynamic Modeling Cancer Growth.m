%% PROJECT DYNAMIC MODELING - GROUP 4B  

%% IMPLEMENTATION EXTENDED CANCER MODEL 
% % Set the time of the y axis
 t0 = 0; tf = 30;  %(day)
% % 
% % % Set the initial condition 
% % % C, D, E, V, aV

% Control; no intial cancer, medium drug levels
% x0 = [0;0.026;2;1;0.0365]

% Control; no drugs administered
% x0 = [49.0497;0;2;1;0]

% Case 1; only chemotherapeutic drug (medium dose)
% x0 = [49.0497;0.026;2;1;0]

% Case 2; only anti-VEGF drug (medium dose)
% x0 = [49.0497;0;2;1;0.0365]

% Case 3; both drugs medium dose
% x0 = [49.0497;0.026;2;1;0.0365]

% Case 4; high dose of chemo, low dose of anti-VEGF
% x0 = [49.0497;0.05;2;1;0.003]

% Case 5; low dose of chemo, high dose of anti-VEGF
% x0 = [49.0497;0.002;2;1;0.07]

% Case 6; both drugs high dose
% x0 = [49.0497;0.05;2;1;0.07]

% % % Solve the ODE system
% % %opts = odeset('RelTol',1e-10,'AbsTol',1e-12);
 [T,X] = ode15s(@P_Model3_reduced,[t0 tf],x0,[]);
% %T saves all time steps; 
% X saves all solutions (first column C, second column D, ..., fifth column A)


% % % Multiple injections 

% Set the time of the simulation
%  t0 = 0; tf = 15;  %(day)

% Set the initial condition
% C, D, E, V, A

% Case 7; repeated injections (every 15 days); both drugs medium dose

%  x0 =  [49.0497;0.026;2;1;0.0365]

% Case 8; repeated injections (every 15 days); both drugs high dose

%  x0 =  [49.0497;0.05;2;1;0.07]

% % Solve the ODE system
% %opts = odeset('RelTol',1e-10,'AbsTol',1e-12);
% [T,X] = ode15s(@(t,y) P_Model3_reduced(t,y),[t0 tf],x0);
% % for loop is used to do an injection every day
% for i=1:1:1
%      x0=[X(end,1); X(end,2)+0.05; X(end,3);X(end,4);X(end,5)+0.07];
%     t0=T(end);
%      tf=T(end)+15;
%      [Tstep,Xstep] = ode15s(@(t,y) P_Model3_reduced(t,y),[t0 tf],x0);
%      T=[T;Tstep];
%      X=[X;Xstep];
%      T2=T;
%      X2=X;
% end 

%Create plots for each variable

figure;
subplot(2,3,1);
plot(T,X(:,1));
xlabel('time (day)');
ylabel('cancer cell volume (mm^3)');

subplot(2,3,2);
plot(T,X(:,2));
xlabel('time (day)');
ylabel('chemotherapeutic drug concentration D (mg/ml)');

subplot(2,3,3);
plot(T,X(:,3));
xlabel('time (day)');
ylabel('endothelial cell density (mm^3)');

subplot(2,3,4);
plot(T,X(:,4));
xlabel('time (day)');
ylabel('VEGF concentration (mg/ml)');

subplot(2,3,5);
plot(T,X(:,5));
xlabel('time (day)');
ylabel('anti-VEGF drug concentration (mg/ml)');

