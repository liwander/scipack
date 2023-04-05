function hypersurf (coefs)
    if !ishyper(coefs)
        warning("not plotted")
        return;
    endif

    a = coefs
    hyp_surf = @(x, y, z) ...
                    a(1,1)*x.^2 + a(2, 2)*y.^2 + a(3, 3)*z.^2 ...
                    + 2*(a(1, 2)*x.*y + a(1, 3)*x.*z + a(2, 3)*y.*z) ...
                    + 2*(a(1, 4)*x + a(2, 4)*y + a(3, 4)*z) ...
                    + a(4, 4);

    [xx, yy, zz] = ndgrid(-5:1:5, -5:1:5, -5:1:5);
    F = hyp_surf(xx, yy, zz)
    isosurface(F, 0);

endfunction