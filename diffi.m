function deriv = diffi (vfunc, ts, h = 1e-8)

    derivative = @(vf, xs, dx) [(vf(xs + dx) - vf(xs))(2, :) / dx];
     
    deriv = [ts; derivative(vfunc, ts, h)];

endfunction