#lang racket
;; Mateusz Obara, pracowania 9 A i B
;; 
;; komentarz: zad B
;; zastosowałem rozwiąznie gdzie seed jest przechowywany w pamięci, pod nazwą __seed__
;; seed jest updatowany w eval-arith, które zwraca teraz
;; parę (val . memory), gdzie memory jest są samą pamięcią przekazaną do eval arith
;; z nowym seedem, jeśli w wyrażeniu znalazł się rand.
;; empty-mem zawiera w sobie __seed__

;; pomocnicza funkcja dla list tagowanych o określonej długości

(define (tagged-tuple? tag len p)
  (and (list? p)
       (= (length p) len)
       (eq? (car p) tag)))

(define (tagged-list? tag p)
  (and (pair? p)
       (eq? (car p) tag)
       (list? (cdr p))))

;;
;; WHILE
;;

(define initial-seed
  123456789)

; memory


(define (set-mem x v m)
  (cond [(null? m)
         (list (cons x v))]
        [(eq? x (caar m))
         (cons (cons x v) (cdr m))]
        [else
         (cons (car m) (set-mem x v (cdr m)))]))

(define (get-mem x m)
  (cond [(null? m) 0]
        [(eq? x (caar m)) (cdar m)]
        [else (get-mem x (cdr m))]))

(define (get-seed m)
  (get-mem '__seed__ m))

(define (set-seed v m)
  (set-mem '__seed__ v m))

(define empty-mem
  (set-seed initial-seed null))

; arith and bool expressions: syntax and semantics

(define (rand? r)
  (tagged-tuple? 'rand 2 r))

(define (rand-max r)
  (second r))

(define (const? t)
  (number? t))

(define (true? t)
  (eq? t 'true))

(define (false? t)
  (eq? t 'false))

(define (op? t)
  (and (list? t)
       (member (car t) '(+ - * / = > >= < <= not and or mod ^))))

(define (op-op e)
  (car e))

(define (op-args e)
  (cdr e))

(define (op->proc op)
  (cond [(eq? op '+) +]
        [(eq? op '*) *]
        [(eq? op '-) -]
        [(eq? op '/) /]
        [(eq? op '=) =]
        [(eq? op '>) >]
        [(eq? op '>=) >=]
        [(eq? op '<)  <]
        [(eq? op '<=) <=]
        [(eq? op 'not) not]
        [(eq? op 'and) (lambda x (andmap identity x))]
        [(eq? op 'or) (lambda x (ormap identity x))]
        [(eq? op 'mod) modulo]
        [(eq? op '^) expt] ;; dla wygody w zad A
))

(define (var? t)
  (symbol? t))

(define (eval-arith e m)
  (cond [(true? e) (cons true m)]
        [(false? e) (cons false m)]
        [(var? e) (cons (get-mem e m) m)]
        [(op? e)
         (define (helpmap lst mem) ;; stary map nie radził sobie z wyrazeniem np 
           (if (null? lst)         ;; (+ (rand 10) (rand 10) (rand 10), stosował ten sam seed dla wszystkich randow
               null                ;; natomiast ta funckja eval-arithuje każdy element listy argumentow z updateowanym seedem co krok
               (let* ([val&m (eval-arith (car lst) mem)]
                      [new_mem (cdr val&m)])
                 (cons val&m (helpmap (cdr lst) new_mem)))))
           (let ([arglist (helpmap (op-args e) m)])
             (cons (apply (op->proc (op-op e)) (map (lambda (x) (car x)) arglist))
                   (cdr (last arglist))))]
        [(const? e) (cons e m)]
        [(rand? e)
         (let*
             ([evaled_max (eval-arith (rand-max e) m)]
              [val (car evaled_max)]
              [newmem (cdr evaled_max)]
              [randout ((rand val) (get-seed newmem))]
              [randval (res-val randout)]
              [new_seed (res-state randout)]
              [updated_mem (set-seed new_seed m)])
         (cons randval updated_mem))]
        ))


;; syntax of commands

(define (assign? t)
  (and (list? t)
       (= (length t) 3)
       (eq? (second t) ':=)))

(define (assign-var e)
  (first e))

(define (assign-expr e)
  (third e))

(define (if? t)
  (tagged-tuple? 'if 4 t))

(define (if-cond e)
  (second e))

(define (if-then e)
  (third e))

(define (if-else e)
  (fourth e))

(define (while? t)
  (tagged-tuple? 'while 3 t))

(define (while-cond t)
  (second t))

(define (while-expr t)
  (third t))

(define (block? t)
  (list? t))

;; state

(define (res v s)
  (cons v s))

(define (res-val r)
  (car r))

(define (res-state r)
  (cdr r))

;; psedo-random generator


(define (rand max)
  (lambda (i)
    (let ([v (modulo (+ (* 1103515245 i) 12345) (expt 2 32))])
      (res (modulo v max) v))))

;; WHILE interpreter

(define (old-eval e m)
  (cond [(assign? e)
         (let* ([val&mem (eval-arith (assign-expr e) m)]
                [val (car val&mem)]
                [mem (cdr val&mem)])
          (set-mem (assign-var e) val mem))]
        [(if? e)
         (let* ([val&mem (eval-arith (if-cond e) m)]
                [val (car val&mem)]
                [mem (cdr val&mem)])
           (if val
               (old-eval (if-then e) mem)
               (old-eval (if-else e) mem)))]
        [(while? e)
         (let* ([val&mem (eval-arith (while-cond e) m)]
                [val (car val&mem)]
                [mem (cdr val&mem)])
           (if val
               (old-eval e (old-eval (while-expr e) mem))
               mem))]
        [(block? e)
         (if (null? e)
             m
             (old-eval (cdr e) (old-eval (car e) m)))]))

(define (eval e m)
  (old-eval e m))

(define (run e)
  (eval e empty-mem))

;; A
(define fermat-test
  '(
    [composite := true]
    (while (> k 0)
           (
            [a := (+ 2 (rand (- n 2)))]
            [e := (^ a (- n 1))]
            [x := (mod e n)]
            (if (= x 1)
                (composite := false)
                (composite := true))
            [k := (- k 1)]))
    ))

(define (probably-prime? n k)
  (let ([memory (set-mem 'k k (set-mem 'n n empty-mem))])
    (not (get-mem
          'composite
          (eval fermat-test memory)))))



;; testy dla rand
#|
(define test_r1 '([x := 3]))
(define test_r2 '([x := (rand 10)]
                  [y := (rand 20)]
                  [z := (rand 30)]))
(define test_r3 '([x := (rand (rand (rand 100)))]))
(define test_r4 '([x := (+ (rand 10) (rand 10) (rand 10))]))
(define test_r5 '([x := 10]
                  [(if (> x (rand 15))
                       [x := -13]
                       [x := 13])]))
(define test_r6 '([x := 0]
                  (while (> (rand 4) 0)
                         ([x := (+ x 1)]))))
;(run test_r2)
|#


;;test dla probably-prime
#|
(probably-prime? 17 3) ;; pierwsza
(probably-prime? 100 5) ;; zlozona
(probably-prime? 101 10) ;; pierwsza
(probably-prime? 1013 10) ;; pierwsza
(probably-prime? 799 10) ;; zlozona
(probably-prime? 1499 10) ;; zlozona (wynik z probably prime: t)
(probably-prime? 1499 1000) ;; zlozona (wynik z probably prime: t)
|#