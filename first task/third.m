syms n k s;
f = @ (x) symsum((2*k - 1).^(3/2)/x.^(5/2),k, 1, x);
l = linspace(1, 100, 100);
y = [];
b = [];
for i  = 1:1:100
   y = [y vpa(f(i))];
   b = [b vpa(f(100))];
end

hold on;
str = '$$\frac{\sum_{k = 1}^{n} (2*k - 1)^{1.5}}{n^{2.5}} = 1.1313536381944006854385615911102, n\rightarrow\infty$$'
title(str,'Interpreter','latex')
plot(l, y);
plot(l, b, '--');

disp('Ñóììà -> ');
disp(vpa(y(100)));
