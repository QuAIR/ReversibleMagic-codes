clear;

%% data preparation
d = 3; % dimension
psp_op = PSP_Operators(d);
psp_op_channel = Generate_A(d, 1);

%% set up T state
zeta = exp(2*pi*i/9);
vt = [zeta 
      1 
      zeta^(-1)];
vt = vt / norm(vt);
rho_T = vt * vt';

%% set up H state
wh = exp(2*pi*i/3);
H = 1/sqrt(3) * [1 1 1; 1 wh wh^2; 1 wh^2 wh];
[S D] = eig(H);
v1 = S(:,1);
v2 = S(:,2);
v3 = S(:,3);
rho_H = v1*v1';

%% set up S state
v1 = [0 1 -1]';
v1 = v1 / norm(v1);
rho_S = v1 * v1';

%% set up N state
v1 = [-1 2 -1]';
v1 = v1 / norm(v1);
rho_N = v1 * v1';

%% transformation
given = rho_H;
expect = rho_N;

epsilon = linspace(0, 0.2, 100);
h_to_n = zeros(1, length(epsilon));
for i = 1:length(epsilon)
    h_to_n(i) = transform_with_pwp(given, expect, psp_op_channel, epsilon(i));
end

%% transformation
given = rho_T;
expect = rho_N;

epsilon = linspace(0, 0.2, 100);
t_to_n = zeros(1, length(epsilon));
for i = 1:length(epsilon)
    t_to_n(i) = transform_with_pwp(given, expect, psp_op_channel, epsilon(i));
end


%% transformation
given = rho_H;
expect = rho_S;

epsilon = linspace(0, 0.4, 100);
h_to_s = zeros(1, length(epsilon));
for i = 1:length(epsilon)
    h_to_s(i) = transform_with_pwp(given, expect, psp_op_channel, epsilon(i));
end

%% transformation
given = rho_T;
expect = rho_S;

epsilon = linspace(0, 0.4, 100);
t_to_s = zeros(1, length(epsilon));
for i = 1:length(epsilon)
    t_to_s(i) = transform_with_pwp(given, expect, psp_op_channel, epsilon(i));
end


%% transformation
given = rho_N;
expect = rho_S;

epsilon = linspace(0, 0.4, 100);
n_to_s = zeros(1, length(epsilon));
for i = 1:length(epsilon)
    n_to_s(i) = transform_with_pwp(given, expect, psp_op_channel, epsilon(i));
end

%% save data
save data.mat h_to_n t_to_n h_to_s t_to_s n_to_s epsilon
