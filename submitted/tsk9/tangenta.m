function tangenta (vfunc, dmin, dmax, n)
        
    % vfunc = f(t) -> [x;
    %                  y]

    ts = linspace(dmin, dmax, 2 * n + 1);

    plot(vfunc(ts)(1, :), vfunc(ts)(2, :));

    derivative = @(vf, ts, dt) [vf(ts + dt) - vf(ts)] / dt;

    vdirection = derivative (vfunc, ts(n+1), 1e-8)
    f_mid = vfunc (ts(n+1))
    tangenta_mid = @(t) vdirection * t + f_mid;

    line(tangenta_mid ([dmin dmax])(1, :), tangenta_mid ([dmin dmax]) (2, :), 'linestyle', '-', 'color', 'r');
    
endfunction