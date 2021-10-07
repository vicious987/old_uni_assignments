#lang racket

(define (lcons x f)
  (cons x f))

(define (lhead l)
  (car l))

(define (ltail l)
  ((cdr l)))

(define (nats-from m)
  (lcons
   m
   (lambda () (nats-from (+ m 1)))))

(define nats
  (nats-from 0))

(define (take n l)
  (if (or (null? l) (= n 0))
      null
      (cons (lhead l)
            (take (- n 1) (ltail l)))))

(define (filter p l)
  (cond [(null? l) null]
        [(p (lhead l))
         (lcons (lhead l)
                (lambda ()
                  (filter p (ltail l))))]
        [else (filter p (ltail l))]))

(define (prime? n)
  (define (div-by m)
    (cond [(= m n) true]
          [(= (modulo n m) 0) false]
          [else (div-by (+ m 1))]))
  (if (< n 2)
      false
      (div-by 2)))
 

(define (fibo-from sec-last last)
  (lcons
   sec-last
   (lambda () (fibo-from last (+ sec-last last)))))

(define fibo (fibo-from 0 1))

(define (integers-from n)
  (if (even? n)
      (lcons (* -1 (/ n 2))
             (lambda () (integers-from (+ n 1))))
      (lcons (floor (/ n 2))
             (lambda () (integers-from (+ n 1))))))

(define ints (integers-from 1))

(define (app xs ys)
  (if (null? xs)
      ys
      (cons (car xs) (app (cdr xs) ys))))
