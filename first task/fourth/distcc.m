function s = distcc(cx, cy, fx, fy)
    distance2 = @ (x) sqrt((cx(x(1)) - fx(x(2))).^2 + (cy(x(1)) - fy(x(2))).^2);
    min_distance = 1e9;
    min_t = 0;
    min_t2 = 0;
    for i = 0:0.1:2*pi
        for j = 0:0.1:2*pi
            if distance2([i j]) <= min_distance
                min_distance = distance2([i j]);
                min_t = i;
                min_t2 = j;
            end
        end
    end
    s2 = 0;
    if (fx(2) ~= 1)
        s2 = 0.3;
    end
    s = fminunc(distance2, [min_t min_t2]); %уточняем расстояние при помощи нахождения минимума функции расстояния между кривыми
    disp(distance2(s));
    text((cx(s(1)) + fx(s(2)))./2 - s2, (cy(s(1)) + fy(s(2)))./2 , num2str(distance2(s)));
    plot([cx(s(1)) fx(s(2))], [cy(s(1)) fy(s(2))]);
end

