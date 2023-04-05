function deriv = diffi (vfunc, ts, h = 1e-8)
    
    % vfunc = f(t) -> [x;
    %                  y]

    derivative = @(vf, ts, dt) [vf(ts + dt) - vf(ts)] / dt;
     
    deriv = derivative(vfunc, ts, h);

endfunction