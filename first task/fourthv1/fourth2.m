rx = @ (x) 5 * sin(x).* cos(x)./x;
ry = @ (x) 5 * sin(x).* sin(x)./x;
f = @ (x) 0.5 + 0.5 * cos(x);
g = @ (x) 2 + 0.3 * sin(x);

a = [1 1];
fx = [];
fy = [];
gx = [];
gy = [];
for i = 0:0.01:2*pi
    fx = [fx rx(i)];
    fy = [fy ry(i)]; 
    gx = [gx f(i)];
    gy = [gy g(i)];
    
end
hold on;
plot(fx, fy);
plot(gx, gy);

disp('Минимальное расстояние между первой кривой и точкой: ');
s1 = distpc2(rx, ry, a);

disp('Минимальное расстояние между эллипсом и точкой: ');
s2 = distpc2(f, g, a);

disp('Минимальное расстояние между кривыми: ');
s3 = distcc2(rx, ry, f, g);


