function ish = ishyper (coefs)
    ish = false;

    if !(ismatrix(coefs) && rows(coefs) && columns(coefs))
        error ("Incorrect input matrix");
        return;
    endif

    minor = @(X, i, j) det(X(setdiff(1:rows(X), i), setdiff(1:columns(X), j)));  
    A = coefs(1:3, 1:3); 
    I1 = trace(A);
    I2 = minor(A, 1, 2) + minor(A, 1, 3) + minor(A, 2, 3);
    I3 = det(A);
    K4 = det(coefs);

    if (I3 == 0)
        if (K4 > 0)
            ish = true;
        endif
    else    
        if (I2 == 0 || I1 * I3 <= 0)
            if (K4 > 0)
                ish = true;
            endif
        endif
    endif

endfunction