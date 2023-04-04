function tangenta (f, dmin, dmax, n)
    func_val_list = @(arg_list) [[f(arg_list(:))'](2, :);];
    xs = linspace(dmin, dmax, 2 * n + 1);
    ys = func_val_list(xs);
    plot(xs, ys)
    % xs(n+1)
    k = -(f(xs(n+1))(2) - f(xs(n+1) + 1e-8)(2)) / 1e-8
    y0 = f(xs(n + 1))(2)
    tang = @(x) (k * (x - xs(n+1)) + f(xs(n + 1))(2))

    line([dmin dmax], [tang(dmin) tang(dmax)], 'linestyle', '-', 'color', 'r');
endfunction