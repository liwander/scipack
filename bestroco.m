function [br, bc] = bestroco (matrix)
    if (nargin == 1 && ismatrix(matrix)) 
        function best_col_matrix = bcm (matrix)

            function res = lv_is_better(v1, v2)
                res = false;
                if (isequal(v1,v2))
                    res = true;
                    return 
                endif 
                for ik = 1:rows(v1)
                    if (v1(ik) > v2(ik))
                        res = true;
                        break
                    endif
                endfor
            endfunction

            function bc_list = best_cols (matrix)
                bc_list = [];
                for ii = 1:columns(matrix)
                    vi_is_good = true;
                    for ij = 1:columns(matrix)
                        if (!lv_is_better(matrix(:, ii), matrix(: , ij)))
                            vi_is_good = false;
                            break
                        endif
                    endfor
                    if (vi_is_good == true)
                        bc_list(columns(bc_list) + 1) = ii;
                    endif
                endfor
            endfunction
            best_col_matrix = matrix(:, unique(best_cols(matrix)));
        
        endfunction

        bc = bcm(matrix);
        br = flipud(bcm(rot90(matrix)))';
    
    else 
        disp("Arguments mismatch funtcion header")
    endif
endfunction