:- module(mateusz_obara_tests, [tests/5]).
:- op(200, fx, ~).
:- op(500, xfy, v).


tests(invalid_1, validity, [a v v b], 500, solution([])).
tests(invalid_2, validity, [v], 500, solution([])). 
tests(invalid_3, validity, [v v], 500, solution([])). 
tests(invalid_4, validity, [~], 500, solution([])). 
tests(invalid_5, validity, [~v], 500, solution([])). 
tests(invalid_6, validity, [~~a], 500, solution([])). 
tests(invalid_7, validity, [~~], 500, solution([])). 

tests(single_1, validity, [a], 500, solution([(a,t)])).
tests(single_2, validity, [a v a], 500, solution([(a,t)])).
tests(single_3, validity, [a v a v a], 500, solution([(a,t)])).
tests(single_4, validity, [~a], 500, solution([(a,f)])).
tests(single_5, validity, [~a v ~a v ~a v ~a], 500, solution([(a,f)])).

tests(single_excluded_middle_1, validity, [a v ~a], 500, solution([(a,t)])).
tests(single_excluded_middle_2, validity, [a v ~a], 500, solution([(a,f)])). 
tests(single_excluded_middle_3, validity, [a v ~a], 500, solution([(a,x)])). 
tests(single_excluded_middle_4, validity, [a v ~a v a], 500, solution([(a,t)])).
tests(single_negated_conjuction_1, validity, [~a v ~b], 500, solution([(a,f),(b,x)])).	% ~(a ^ b)
tests(single_implication_1, validity, [~a v b], 500, solution([(a,t),(b,t)])). 	% (a => b)
tests(single_implication_2, validity, [~a v b], 500, solution([(a,f),(b,x)])).

tests(single_simple_case_1, validity, [a v b], 500, solution([(a,t),(b,x)])).
tests(single_simple_case_2, validity, [a v b], 500, solution([(a,x),(b,t)])).
tests(single_simple_case_3, validity, [a v b v c v d v e], 500, solution([(a,t),(b,x),(c,x),(d,x),(e,x)])).
tests(single_simple_case_4, validity, [a v b v c v d v e], 500, solution([(a,x),(b,t),(c,x),(d,x),(e,x)])).
tests(single_simple_case_5, validity, [a v b v c v d v e], 500, solution([(a,x),(b,x),(c,t),(d,x),(e,x)])).
tests(single_simple_case_6, validity, [a v b v c v d v e], 500, solution([(a,x),(b,x),(c,x),(d,t),(e,x)])).
tests(single_simple_case_7, validity, [a v b v c v d v e], 500, solution([(a,x),(b,x),(c,x),(d,x),(e,t)])).
tests(simple_case_1, validity, [a,b,c,d,e], 500, solution([(a,t),(b,t),(c,t),(d,t),(e,t)])).
tests(simple_case_2, validity, [a v b,~a v ~b], 500, solution([(a,t),(b,t),(c,t),(d,t),(e,t)])).

tests(double_1, validity, [a v b, c v d], 500, solution([(a,t),(b,x),(c,t),(d,x)])).
tests(double_2, validity, [a v b, c v d], 500, solution([(a,t),(b,x),(c,x),(d,t)])).
tests(double_3, validity, [a v b, c v d], 500, solution([(a,x),(b,t),(c,x),(d,t)])).
tests(double_4, validity, [a v b, c v d], 500, solution([(a,x),(b,t),(c,t),(d,x)])).

tests(double_5, validity, [a v b, a v b], 500, solution([(a,t),(b,t)])).
tests(double_6, validity, [a v b, a v b], 500, solution([(a,f),(b,t)])).
tests(double_7, validity, [a v b, a v b], 500, solution([(a,t),(b,f)])).
tests(double_8, validity, [a v b, a v b], 500, solution([(a,t),(b,x)])).
tests(double_9, validity, [a v b, a v b], 500, solution([(a,x),(b,t)])).

tests(no_solution_1, validity, [], 500, solution([])).				
tests(no_solution_2, validity, [a,~a], 500, solution([])).

tests(a_in_every_clause, validity, [b v a, c v a v d, e v f v a], 500, solution([(a,t),(b,x),(c,x),(d,x),(e,x),(f,x)])).

tests(two_implications_1, validity, [~a v b, ~b v c], 500, solution([(a,x),(b,t),(c,t))])). %(a => b, b => c)
tests(two_implications_2, validity, [~a v b, ~b v c], 500, solution([(a,f),(b,x),(c,f))])). %(a => b, b => c)
tests(two_implications_3, validity, [~a v b, ~b v c], 500, solution([(a,t),(b,t),(c,t))])). %(a => b, b => c)

tests(if_and_only_if_1, validity, [~a v b, ~b v c,~c v a], 500, solution([(a,t),(b,t),(c,t))])).    %(a => b, b => c, c => a)
tests(if_and_only_if_2, validity, [~a v b, ~b v c,~c v a], 500, solution([(a,f),(b,f),(c,f))])).    %(a => b, b => c, c => a)
tests(if_and_only_if_3, validity, [~a v b, ~b v c,~c v a, b], 500, solution([(a,t),(b,t),(c,t))])). %(a => b, b => c, c => a)

tests(if_and_only_if_performance_1, performance, [~a v b, ~b v c, ~c v a, ~d v e, ~e v f, ~f v d, ~c v d, ~d v c, a], 500, solution([(a,t),(b,t),(c,t),(d,t),(e,t),(f,t))])). %(a <=> b <=> c <=> d <=> e <=> f, a)
tests(if_and_only_if_performance_2, performance, [~a v b, ~b v c, ~c v a, ~d v e, ~e v f, ~f v d, ~c v d, ~d v c, a], 750, solution([(a,t),(b,t),(c,t),(d,t),(e,t),(f,t))])). %(a <=> b <=> c <=> d <=> e <=> f, a)
tests(if_and_only_if_performance_3, performance, [~a v b, ~b v c, ~c v a, ~d v e, ~e v f, ~f v d, ~c v d, ~d v c, a], 1000, solution([(a,t),(b,t),(c,t),(d,t),(e,t),(f,t))])). %(a <=> b <=> c <=> d <=> e <=> f, a)
tests(if_and_only_if_performance_4, performance, [~a v b, ~b v c, ~c v a, ~d v e, ~e v f, ~f v d, ~c v d, ~d v c, a], 1250, solution([(a,t),(b,t),(c,t),(d,t),(e,t),(f,t))])). %(a <=> b <=> c <=> d <=> e <=> f, a)
tests(if_and_only_if_performance_5, performance, [~a v b, ~b v c, ~c v a, ~d v e, ~e v f, ~f v d, ~c v d, ~d v c, a], 1500, solution([(a,t),(b,t),(c,t),(d,t),(e,t),(f,t))])). %(a <=> b <=> c <=> d <=> e <=> f, a)
tests(if_and_only_if_performance_6, performance, [~a v b, ~b v c, ~c v a, ~d v e, ~e v f, ~f v d, ~c v d, ~d v c, a], 1750, solution([(a,t),(b,t),(c,t),(d,t),(e,t),(f,t))])). %(a <=> b <=> c <=> d <=> e <=> f, a)
tests(if_and_only_if_performance_7, performance, [~a v b, ~b v c, ~c v a, ~d v e, ~e v f, ~f v d, ~c v d, ~d v c, a], 2000, solution([(a,t),(b,t),(c,t),(d,t),(e,t),(f,t))])). %(a <=> b <=> c <=> d <=> e <=> f, a)
tests(if_and_only_if_performance_8, performance, [~a v b, ~b v c, ~c v a, ~d v e, ~e v f, ~f v d, ~c v d, ~d v c, a], 3000, solution([(a,t),(b,t),(c,t),(d,t),(e,t),(f,t))])). %(a <=> b <=> c <=> d <=> e <=> f, a)
tests(if_and_only_if_performance_9, performance, [~a v b, ~b v c, ~c v a, ~d v e, ~e v f, ~f v d, ~c v d, ~d v c, a], 4000, solution([(a,t),(b,t),(c,t),(d,t),(e,t),(f,t))])). %(a <=> b <=> c <=> d <=> e <=> f, a)
tests(if_and_only_if_performance_10, performance,[~a v b, ~b v c, ~c v a, ~d v e, ~e v f, ~f v d, ~c v d, ~d v c, a], 5000, solution([(a,t),(b,t),(c,t),(d,t),(e,t),(f,t))])). %(a <=> b <=> c <=> d <=> e <=> f, a)

tests(many_clauses_perfomance_1, performance, [a v b c v d v e, e v f v g, e v a v ~b, a v e v c, d  v ~c, a v d], 500, solution([(a,x),(b,x),(c,f),(d,t),(e,t),(f,x),(g,x)])).
tests(many_clauses_perfomance_2, performance, [a v b c v d v e, e v f v g, e v a v ~b, a v e v c, d  v ~c, a v d], 1000, solution([(a,x),(b,x),(c,f),(d,t),(e,t),(f,x),(g,x)])).
tests(many_clauses_perfomance_3, performance, [a v b c v d v e, e v f v g, e v a v ~b, a v e v c, d  v ~c, a v d], 1500, solution([(a,x),(b,x),(c,f),(d,t),(e,t),(f,x),(g,x)])).
tests(many_clauses_perfomance_4, performance, [a v b c v d v e, e v f v g, e v a v ~b, a v e v c, d  v ~c, a v d], 2000, solution([(a,x),(b,x),(c,f),(d,t),(e,t),(f,x),(g,x)])).
tests(many_clauses_perfomance_5, performance, [a v b c v d v e, e v f v g, e v a v ~b, a v e v c, d  v ~c, a v d], 3000, solution([(a,x),(b,x),(c,f),(d,t),(e,t),(f,x),(g,x)])).
tests(many_clauses_perfomance_6, performance, [a v b c v d v e, e v f v g, e v a v ~b, a v e v c, d  v ~c, a v d], 4000, solution([(a,x),(b,x),(c,f),(d,t),(e,t),(f,x),(g,x)])).
tests(many_clauses_perfomance_7, performance, [a v b c v d v e, e v f v g, e v a v ~b, a v e v c, d  v ~c, a v d], 5000, solution([(a,x),(b,x),(c,f),(d,t),(e,t),(f,x),(g,x)])).
tests(many_clauses_perfomance_8, performance, [a v b c v d v e, e v f v g, e v a v ~b, a v e v c, d  v ~c, a v d], 6000, solution([(a,x),(b,x),(c,f),(d,t),(e,t),(f,x),(g,x)])).
tests(many_clauses_perfomance_9, performance, [a v b c v d v e, e v f v g, e v a v ~b, a v e v c, d  v ~c, a v d], 7000, solution([(a,x),(b,x),(c,f),(d,t),(e,t),(f,x),(g,x)])).
tests(many_clauses_perfomance_10, performance, [a v b c v d v e, e v f v g, e v a v ~b, a v e v c, d  v ~c, a v d], 8000, solution([(a,x),(b,x),(c,f),(d,t),(e,t),(f,x),(g,x)])).

tests(excluded_middle, validity, [p v ~p], 500, solution([(p,t)])).
