f = @ (x) 2.*cos(x)./sqrt(x) - 0.77;
g = @ (x) (x-2).*(x-5).*(x-6).*(x-7).*(x-9)./100;
x = linspace(0, 10, 1000);
hold on;
plot(x, f(x));
text(0.1, 2 + f(0.1), 'f(x)');
plot(x, g(x));
text(0.1, g(0.1), 'g(x)');
s  = @ (x)  f(x) - g(x);
plot(x, s(x));
text(0.1, 2 + s(0.1), 'f(x) - g(x)');
res = [];
t = [];
for i = 1:3
    a = ginput(1);
    res = [res fzero(s, a(1))];
end    
disp('Корни:');
disp(res);
%полученные корни: 1.7861 5.8603 6.2662