lmd_center = 568.5; % nm
bandwidth = 107; % nm
pixel = 0.01; % mm
n_ccd = 2048;
f = 90; % mm
theta_i = 30.9/180*pi; % rad
d = 1/1800; % mm

load('B_scan.mat');
data = double(B_scan_data);
data = flipud(data);
data = medfilt2(data);

% plot raw data
% plot_show(data, 410);

% compute endpoint lambda for CCD array
theta_d = asin(lmd_center*1e-6/d - sin(theta_i));
rho = pixel*cos(theta_d)*d/f*1e6; % nm/pixel
lmd_0 = lmd_center - (n_ccd*rho)/2;
lmd_1 = lmd_center + (n_ccd*rho)/2;

shape = size(data);


ave = zeros(shape(1), 1);
for row = 1:shape(1)
    ave(row) = mean(data(row, :), 2);
end

for col = 1:shape(2)
    i = data(:, col);
    i = i - ave;
    data(:, col) = i;
end

% plot raw data
plot_show(data, 410);

for col = 1:shape(2)
    i = data(:, col); 
    length = size(i, 1);
    % resample
    lmd_scale = linspace(lmd_0, lmd_1, length);
    k_0 = 2*pi/lmd_1;
    k_1 = 2*pi/lmd_0;
    k_scale = linspace(k_0, k_1, length);
    inv_lmd = 2*pi./lmd_scale;
    i = interp1q(flipud(inv_lmd'), flipud(i), k_scale'); 
    
    temp = zeros(1, 2*shape(1));
    temp(1:shape(1)) = i;
    i = abs(ifftn(temp));
    i = i(shape(1)+1:end);
    
    i(abs(i)>10)=0;
    data(:, col) = i;
    disp(['A-line: ', num2str(col)])
    
end
plot_show(data, 410);