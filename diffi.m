function deriv = diffi (func, ts, h = 1e-8)
    val_list = @(arg_list) [func(arg_list(:))'](2, :);    
    der = (val_list(ts + h) - val_list(ts)) / h;
    
    deriv = [ts; der];
    plot(ts, der);

endfunction