function s = distcc(cx, cy, cz, fx, fy, fz)
    distance2 = @(t) sqrt((fx(t(1), t(2)) - cx(t(3), t(4))).^2 + (fy(t(1), t(2)) - cy(t(3), t(4))) .^ 2 + (fz(t(1), t(2)) - cz(t(3), t(4))) .^ 2);
    min_distance = 1e9;
    m = [];
    for i = 0:0.5:2*pi
         for j = -pi:0.5:pi
             for v = 0:0.5:2*pi
                for k = -pi:0.5:pi
                    if distance2([i j v k]) < min_distance
                        min_distance = distance2([i j v k]);
                        m = [i j v k];
                    end;
                end;
             end;
         end;
    end;
    s = fminunc(distance2, m);
    disp(distance2(s));
    plot3([fx(s(1), s(2)) cx(s(3), s(3))], [fy(s(1), s(2)) cy(s(3), s(4))], [fz(s(1), s(2)) cz(s(3), s(4))]);
end

