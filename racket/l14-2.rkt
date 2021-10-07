#lang racket

(require compatibility/mlist)

(define test1 (mlist 1 2 3 4 5))
;(define mtest1 (list->mlist test1))
#|
(define (make-cycle l)
  (let* ([len (mlength l)]
         [last (mlist-tail l (- len 1))])
     (set-mcdr! last l)))

(define t1 (make-cycle test1))

(mlist-ref t1 8)
|#

(define (make-cycle xs)
  (define (iter x)
    (if (null? (mcdr x))
               (set-mcdr! x xs)
               (iter (mcdr x))))
  (iter xs))

(define (has-cycle? lst)
  (define (iter x seen_list)
    (if (member lst seen_list)
        (#true)
        (

(define (has-cycle? lst seen_list)
  (if (member lst seen_list)
      (#true)
      (has-cycle (mcdr lst) (cons (mcdr lst) 