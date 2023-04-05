    function res = nmsup (A, deg = 1)

        res = uint8(A);

        function nbhd = moore_neighborhood (matrix, row_ind, col_ind, nbhd_deg = 1)
            nbhd = [];

            lind = col_ind - [0:nbhd_deg];
            l = min(lind(lind > 0));

            rind = col_ind + [0:nbhd_deg];
            r = max(rind(rind <= columns(matrix)));
            
            bind = row_ind + [0:nbhd_deg];
            b = max(bind(bind <= rows(matrix)));

            tind = row_ind - [0:nbhd_deg];
            t = min(tind(tind > 0));

            nbhd = matrix(t:b, l:r);
        
        endfunction

        function inb = is_biggest_in_neighborhood (el, neighborhood)
            inb = all(all(neighborhood <= el));
        endfunction 

        for i = 1:rows(A)
            for j = 1:columns(A)
                if (!is_biggest_in_neighborhood(A(i, j), moore_neighborhood(A, i, j, deg)))
                    res(i, j) = uint8(0);
                endif
            endfor
        endfor

    endfunction