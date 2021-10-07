% NIE ZAPOMNIJ USUNAC TEJ LINIJKI
:- module(mateusz_obara_tests, [tests/5]).
:- op(200, fx, ~).
:- op(500, xfy, v).

tests(empty, validity, [], 500, solution([])).				

tests(single_1, validity, [a], 500, solution([(a,t)])).
tests(single_2, validity, [a v a], 500, solution([(a,t)])).
tests(single_3, validity, [a v a v a], 500, solution([(a,t)])).
tests(single_4, validity, [~a], 500, solution([(a,f)])).
tests(single_5, validity, [~a v ~a v ~a v ~a], 500, solution([(a,f)])).

tests(excluded_middle_1, validity, [a v ~a], 500, solution([(a,t)])). %basic logic stuff
tests(excluded_middle_2, validity, [a v ~a], 500, solution([(a,f)])). 
tests(excluded_middle_3, validity, [a v ~a], 500, solution([(a,x)])). 
tests(excluded_middle_4, validity, [a v ~a], 500, solution([(a,f)])).
tests(excluded_middle_5, validity, [a v ~a v a], 500, solution([(a,t)])).
tests(negated_conjuction_1, validity, [~a v ~b], 500, solution([(a,f),(b,x)])).	% ~(a ^ b)
tests(implication_1, validity, [a v ~b], 500, solution([(a,t),(b,t)])). 	% (a => b)
tests(implication_2, validity, [a v ~b], 500, solution([(a,f),(b,x)])).

tests(simple_case_1, validity, [a v b], 500, solution([(a,t),(b,x)])).
tests(simple_case_2, validity, [a v b], 500, solution([(a,x),(b,t)])).
tests(simple_case_3, validity, [a v b v c v d v e], 500, solution([(a,t),(b,x),(c,x),(d,x),(e,x)])).
tests(simple_case_4, validity, [a v b v c v d v e], 500, solution([(a,x),(b,t),(c,x),(d,x),(e,x)])).
tests(simple_case_5, validity, [a v b v c v d v e], 500, solution([(a,x),(b,x),(c,t),(d,x),(e,x)])).
tests(simple_case_6, validity, [a v b v c v d v e], 500, solution([(a,x),(b,x),(c,x),(d,t),(e,x)])).
tests(simple_case_7, validity, [a v b v c v d v e], 500, solution([(a,x),(b,x),(c,x),(d,x),(e,t)])).
tests(simple_case_3, performance, [~a v ~b v ~c v ~d v ~e v e v d v c v b v a], 500, solution([(a,x),(b,x),(c,x),(d,x),(e,x)])).


tests(invalid_1, validity, [a V b], 500, solution([(a,t),(b,x)])).
tests(invalid_2, validity, [A v b], 500, solution([(A,t),(b,x)])).
tests(invalid_3_empty, validity, [[] v b], 500, solution([(b,t)])).
tests(invalid_4, validity, [~~a v b], 500, solution([(b,t)])).
tests(invalid_5, validity, [~~a], 500, solution([(a,t)])).

tests(excluded_middle, validity, [p v ~p], 500, solution([(p,t)])).
