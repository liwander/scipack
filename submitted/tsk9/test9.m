ts = linspace(-1, 1, 10);

function point = vecf (t)
    x = cos(t);
    y = sin(t);
    point = [x; y];
endfunction

diffi (@vecf, ts)
tangenta(@vecf, -2, 10, 10) 