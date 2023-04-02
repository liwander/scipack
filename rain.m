function res = rain (rows_number, columns_number)

    function res = rain_matrix(rows_number, columns_number)
        res = uint32([1:rows_number])
        res = res'
        res = repmat(res, 1, columns_number)
    endfunction

    switch (nargin)
        case 1
            res = rain_matrix(rows_number, rows_number)
        case 2 
            res = rain_matrix(rows_number, columns_number)
        otherwise 
            disp("Arguments number does not match function description")
            res = []
    endswitch

endfunction