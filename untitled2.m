clc;
clear;
close all;

a = 1;                
theta = 5*pi/180;      
N = 8;              
d = 2;               

x = [];
y = [];

for i = -N:N
    for j = -N:N
        
        x1 = i*sqrt(3)*a + j*sqrt(3)/2*a;
        y1 = j*3/2*a;
        
        x = [x; x1];
        y = [y; y1];
        
        x = [x; x1 + sqrt(3)/2*a];
        y = [y; y1 + a/2];
        
    end
end

z_mid = zeros(size(x));

R1 = [cos(theta) -sin(theta); sin(theta) cos(theta)];
R2 = [cos(-theta) -sin(-theta); sin(-theta) cos(-theta)];

top = R1 * [x y]';
bottom = R2 * [x y]';

x_top = top(1,:)';
y_top = top(2,:)';
z_top = d*ones(size(x_top));

x_bot = bottom(1,:)';
y_bot = bottom(2,:)';
z_bot = -d*ones(size(x_bot));

figure
hold on

scatter3(x_top, y_top, z_top, 15, 'r', 'filled')     
scatter3(x, y, z_mid, 15, 'b', 'filled')             
scatter3(x_bot, y_bot, z_bot, 15, 'm', 'filled')     

axis equal
axis off     
view(30,20)