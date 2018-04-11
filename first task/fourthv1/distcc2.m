function s = distcc(cx, cy, fx, fy)
    distance2 = @ (x, y, x2, y2) sqrt((x - x2).^2 + (y - y2).^2);
    min_distance = 1e9;
    min_t = 0;
    min_t2 = 0;
    for i = 0:0.01:2*pi
        for j = 0:0.01:2*pi
            if distance2(fx(i),fy(i),cx(j),cy(j)) <= min_distance
                min_distance = distance2(fx(i),fy(i),cx(j),cy(j));
                min_t = i;
                min_t2 = j;
            end
        end
    end
    s = [min_distance min_t min_t2];
    disp(s(1));
    text((cx(s(2)) + cy(s(2)))./2 - 1.2, (fx(s(3)) + fy(s(3)))./2 + 0.3, num2str(s(1)));
    plot([cx(s(2)) fx(s(3))], [cy(s(2)) fy(s(3))]);
end

