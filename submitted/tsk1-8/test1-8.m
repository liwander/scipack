t_list = {
    {uint8(1),1}, 
    {uint8([1 2 3 2 1]),1},
    {uint8([1; 2; 1; 2; 1]),1},
    {uint8([1; 2; 1; 2; 1])},
    {uint8([0 1 1 0; 3 1 2 0;0 0 1 1]),1}
};

ans_list = {
    [1], 
    [0 0 3 0 0],
    [0; 2; 0; 2; 0],
    [0; 2; 0; 2; 0],
    [0 0 0 0;3 0 2 0;0 0 0 0]
};

function rss = solution (arg_list)
    sol = @nmsup;
    rss = sol(arg_list{:});
endfunction

function test (tests_list, answers_list)
    for test_case_ind = 1:length(tests_list)
        answer = solution(tests_list{test_case_ind});
        disp(answer);
        disp(isequal(answer, answers_list{test_case_ind})); 
        printf('-------\n');
    endfor
endfunction

test(t_list, ans_list);