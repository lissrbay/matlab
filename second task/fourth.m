[x2, y2] = meshgrid([-pi:0.05:pi]);
z2 = 3 .* y2 + 4 .* x2 + 7;

x = @(t, t2) sqrt(2/3) .* sin(t) .* cos(t2);
y = @(t, t2) sin(t) .* sin(t2);
z = @(t, t2) sqrt(2) .* cos(t);

fx = @(t, t2) t;
fy = @(t, t2) t2;
fz = @(t, t2) 3 .* t2 + 4.* t + 7;

ptx = @(t, t2) 0.7;
pty = @(t, t2) 0.7;
ptz = @(t, t2) 4;

hold on;
axis vis3d;
axis([-5 5 -5 5 -pi 5]);
surf(x2, y2, z2);
x1 = [];
y1 = [];
z1 = [];

for i = 0:0.05:2 * pi
    for j = -pi:0.05:pi
        x1 = [x1 x(i, j)];
        y1 = [y1 y(i, j)];
        z1 = [z1 z(i)];
    end
end

plot3(x1, y1, z1);

distcc(x, y, z, ptx, pty, ptz);
distcc(fx, fy, fz, ptx, pty, ptz);
distcc(x, y, z, fx, fy, fz);