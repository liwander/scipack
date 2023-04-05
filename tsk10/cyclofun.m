function roulette = cyclofun (vfunc, rad, ts)
    derivative = @(vf, xs, dx) [(vf(xs + dx) - vf(xs))(2, :) / dx];
    cycloid = vfunc(ts) #- r(t) * derivative(vfunc, ts, dx)

endfunction