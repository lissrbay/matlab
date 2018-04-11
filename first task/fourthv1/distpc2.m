function s = distpc(cx, cy, point)
    distance2 = @ (x, y, x2, y2) sqrt((x - x2).^2 + (y - y2).^2);
    min_t = 0;
    min_distance = 1e9;
    for i = 0: 0.0001 : 2*pi
        if distance2(cx(i), cy(i), point(1), point(2)) <= min_distance
            min_distance = distance2(cx(i), cy(i), point(1), point(2));
            min_t = i;
        end;

    end;
    s = [min_t min_distance];
    disp(s(2));
    text(1, (cx(s(1)) + cy(s(1)))./2, num2str(s(2)));
    plot([1 cx(s(1))], [1 cy(s(1))]);

end

