f = @ (x) asin(2.* sin(x))+sqrt(cos(x.^2)).*cos(sqrt(x)) + abs(x).^(1./log(x + 2));
x = [];
y = [];
z = [];
for i = -2*pi:0.01:2*pi
   x = [x i];
   y = [y real(f(i))];
   z = [z imag(f(i))];
end
hold on;
plot(x, y);
plot(x, z);
result = [f(3.4), f(5.0)];
disp('f(3.4) = ');
disp(result(1));
disp('f(5.0) = ');
disp(result(2));