function res = diagsn (rows_number, columns_number)
    
    function res = snake_matrix (rows_number, columns_number)
        res = uint32(zeros(rows_number, columns_number))
        mx_ln = rows_number * columns_number
        mx_diag_ln = min(rows_number, columns_number)
        
        snk_ln = 0
        ii = 1
        ij = 1

        is_top = true

        diags = [1:mx_diag_ln - 1]
        diags = [diags, mx_diag_ln(ones(1, (mx_ln - 2 * sum(diags)) / 3 ))]
        diags = [diags, fliplr(1:mx_diag_ln - 1)]      
        
        for dg_num = 1:columns(diags)
            if (is_top)
                res(ii, ij) += (++snk_ln)
                for m = 1:(diags(dg_num) - 1)
                    res(++ii, --ij) += ++snk_ln
                endfor
                is_top = !is_top
                if (ii < rows_number) 
                    ii++
                else
                    ij++
                endif

            else
                res(ii, ij) += ++snk_ln
                for m = 1:(diags(dg_num) - 1)
                    res(--ii, ++ij) += ++snk_ln
                endfor
                is_top = !is_top
                if (ij < rows_number) 
                    ij++
                else
                    ii++
                endif
            endif
        endfor

    endfunction

    switch (nargin)
        case 1 
            res = snake_matrix(rows_number, rows_number)
        case 2
            res = snake_matrix(rows_number, columns_number)
        otherwise 
            disp("mismatching arguments number")
    endswitch 

endfunction