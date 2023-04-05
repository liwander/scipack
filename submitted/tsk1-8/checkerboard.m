function res = checkerboard (rows_number, columns_number)

    function board = create_checkerboard (rows_number, columns_number)
        board = false(rows_number, columns_number)
        board(1:2:rows_number, 1:2:columns_number) = true
        board(2:2:rows_number, 2:2:columns_number) = true
    endfunction

    switch (nargin)
        case 1
            res = create_checkerboard(rows_number, rows_number)
        case 2 
            res = create_checkerboard(rows_number, columns_number)
        otherwise 
            printf("Arguments number does not match function description\n")
            res = []
    endswitch

endfunction