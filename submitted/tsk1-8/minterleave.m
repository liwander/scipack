function res = minterleave (varargin)

    res = [];
    k = rows(varargin{1});
    mxn_col = columns(varargin{1});

    for i = 2:length(varargin)
        if rows(varargin{i}) != k
            return
        endif
        mxn_col = max(mxn_col, columns(varargin{i}));
    endfor

    for col = 1:mxn_col
        for matr = 1:length(varargin)
            if (col <= columns(varargin{matr}))
                res = [res, (varargin{matr})(:, col)];
            endif 
        endfor
    endfor

endfunction