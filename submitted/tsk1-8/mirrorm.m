function res = mirrorm (matrix, layers) 
    function res = horizontal_reflection (matrix, layers)
        res = [fliplr(matrix)(:, columns(matrix) - layers + 1: columns(matrix)), matrix, fliplr(matrix)(:, 1:layers)]
    endfunction

    function res = vertical_reflection (matrix, layers)
        res = [flipud(matrix)(rows(matrix) - layers + 1:rows(matrix) , :); matrix ; flipud(matrix)(1:layers , :)]
    endfunction

    base_matrix = matrix
    res = matrix

    function res = edit_reflected_corners (matrix, layers)
        bmrn = rows(base_matrix)
        bmcn = columns(base_matrix)
        rn = rows(matrix)
        cn = columns(matrix)
        res = matrix

        %top - left
        res(1:layers, 1:layers) = rot90(transpose((base_matrix)(1:layers , 1:layers)), 2)
        %top - right
        res(1:layers, cn - layers + 1:cn) = transpose((base_matrix)(1:layers , bmcn - layers + 1:bmcn))
        %bottom - left
        res(rn - layers + 1:rn, 1:layers) = transpose((base_matrix)(bmrn - layers + 1:bmrn , 1:layers))
        %bottom  - right
        res(rn - layers + 1:rn, cn - layers + 1:cn) = rot90(transpose(base_matrix(bmrn - layers + 1:bmrn , bmcn - layers + 1:bmcn)), 2)
    endfunction

    res = vertical_reflection(res, layers)
    res = horizontal_reflection(res, layers)
    res = edit_reflected_corners(res, layers)

endfunction 