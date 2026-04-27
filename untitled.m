a = 2.46;
gamma0 = -2.6;
gamma1 = 0.36;

kx = linspace(-2, 2, 500);
ky = linspace(-2, 2, 500);

[KX, KY] = meshgrid(kx, ky);

f_k = exp(1i * a * KX / sqrt(3)) + exp(-1i * a * KX / sqrt(3) + 1i * sqrt(3) * a * KY / 2) + exp(-1i * a * KX / sqrt(3) - 1i * sqrt(3) * a * KY / 2);

f_abs = abs(f_k);

E_plus_a1 = zeros(size(KX));
E_minus_a1 = zeros(size(KX));
E_plus_a2 = zeros(size(KX));
E_minus_a2 = zeros(size(KX));

for alpha = 1:2
    term = (-1)^alpha * gamma1 + sqrt(4 * (f_abs.^2) * (gamma0^2) + (gamma1^2));
    E_plus = 0.5 * term;
    E_minus = -0.5 * term;

    if alpha == 1
        E_plus_a1 = E_plus;
        E_minus_a1 = E_minus;
    else
        E_plus_a2 = E_plus;
        E_minus_a2 = E_minus;
    end
end

figure('Name','3D Band Structure','NumberTitle','off');

mesh(KX, KY, E_plus_a1, 'FaceColor','interp'); hold on;
mesh(KX, KY, E_minus_a1, 'FaceColor','interp');
mesh(KX, KY, E_plus_a2, 'FaceColor','interp');
mesh(KX, KY, E_minus_a2, 'FaceColor','interp');

xlabel('k_x (rad/a)');
ylabel('k_y (rad/a)');
zlabel('Energy (eV)');

title('3D Band Structure from Eq. (98)');
legend('\alpha=1 (+)','\alpha=1 (-)','\alpha=2 (+)','\alpha=2 (-)','Location','best');

grid on;
shading interp;
colormap jet;
colorbar;
view(45,30);