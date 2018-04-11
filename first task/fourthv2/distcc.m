function s = distcc(cx, cy, fx, fy)
    distance2 = @ (x) sqrt((cx(x) - fx(x)).^2 + (cy(x) - fy(x)).^2);
    s2 = 0;
    if (fx(2) ~= 1)
        s2 = 0.3;
    end
    s = fminunc(distance2, 3); %уточняем расстояние при помощи нахождения минимума функции расстояния между кривыми
    disp(distance2(s));
    text((cx(s) + fx(s))./2 - s2, (cy(s) + fy(s))./2 , num2str(distance2(s)));
    plot([cx(s) fx(s)], [cy(s) fy(s)]);
end

