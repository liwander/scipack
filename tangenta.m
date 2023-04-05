function tangenta (vfunc, dmin, dmax, n)
        
    xs = linspace(dmin, dmax, 2 * n + 1);
    f_table = vfunc(xs);
    plot(f_table(1, :), f_table(2, :));

    derivative = @(vf, xs, dx) [(vf(xs + dx) - vf(xs))(2, :) / dx];

    inclin_ang_mid = derivative(vfunc, xs(n+1), 1e-8);
    y_mid = vfunc(xs(n+1));
    tang_mid = @(x) (inclin_ang_mid * (x - xs(n+1)) + vfunc(xs(n + 1))(2, 1));

    line([dmin dmax], [tang_mid(dmin) tang_mid(dmax)], 'linestyle', '-', 'color', 'r');
    
endfunction