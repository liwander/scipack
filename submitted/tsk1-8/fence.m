function res = fence (rows_number, columns_number)

    function fence = create_fence (rows_number, columns_number)
        fence = false(rows_number, columns_number)
        fence(:, 1:2:columns_number) = true
    endfunction

    switch (nargin)
        case 1
            res = create_fence(rows_number, rows_number)
        case 2 
            res = create_fence(rows_number, columns_number)
        otherwise 
            printf("Arguments number does not match function description\n")
            res = []
    endswitch

endfunction