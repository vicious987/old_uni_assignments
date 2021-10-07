#lang racket
;; Mateusz Obara, pracownia 6

(define (const? t)
  (number? t))

(define (binop? t)
  (and (list? t)
       (= (length t) 3)
       (member (car t) '(+ - * /))))

(define (binop-op e)
  (car e))

(define (binop-left e)
  (cadr e))

(define (binop-right e)
  (caddr e))

(define (binop-cons op l r)
  (list op l r))

(define (op->proc op)
  (cond [(eq? op '+) +]
        [(eq? op '*) *]
        [(eq? op '-) -]
        [(eq? op '/) /]))

(define (let-def? t)
  (and (list? t)
       (= (length t) 2)
       (symbol? (car t))))

(define (let-def-var e)
  (car e))

(define (let-def-expr e)
  (cadr e))

(define (let-def-cons x e)
  (list x e))

(define (let? t)
  (and (list? t)
       (= (length t) 3)
       (eq? (car t) 'let)
       (let-def? (cadr t))))

(define (let-def e)
  (cadr e))

(define (let-expr e)
  (caddr e))

(define (let-cons def e)
  (list 'let def e))

(define (var? t)
  (symbol? t))

(define (var-var e)
  e)

(define (var-cons x)
  x)

(define (hole? t)
  (eq? t 'hole))

(define (arith/let/holes? t)
  (or (hole? t)
      (const? t)
      (and (binop? t)
           (arith/let/holes? (binop-left  t))
           (arith/let/holes? (binop-right t)))
      (and (let? t)
           (arith/let/holes? (let-expr t))
           (arith/let/holes? (let-def-expr (let-def t))))
      (var? t)))

(define (num-of-holes t)
  (cond [(hole? t) 1]
        [(const? t) 0]
        [(binop? t)
         (+ (num-of-holes (binop-left  t))
            (num-of-holes (binop-right t)))]
        [(let? t)
         (+ (num-of-holes (let-expr t))
            (num-of-holes (let-def-expr (let-def t))))]
        [(var? t) 0]
         )
  )

(define (arith/let/hole-expr? t)
  (and (arith/let/holes? t)
       (= (num-of-holes t) 1)))

(define (hole-context_ e lst)
  (cond [(hole? e) lst]
        [(binop? e)
         (if (arith/let/hole-expr? (binop-left e))
             (hole-context_ (binop-left e) lst)
             (hole-context_ (binop-right e) lst))]
        [(let? e)
         (if (arith/let/hole-expr? (let-expr e))
             (if (member (let-def-var (let-def e)) lst)
                 (hole-context_ (let-expr e) lst)
                 (hole-context_ (let-expr e) (cons (let-def-var (let-def e)) lst)))
             (hole-context_ (let-def e) lst))]
        [(let-def? e) (hole-context_ (let-def-expr e) lst)]))
            
(define (hole-context e)
  (hole-context_ e null))


;;proc pomocnicze dla testowania

;; list, list -> bool
;; sprawdza czy dwie listy maja te same elementy
(define (same-members? lst1 lst2)
  (and (= (length lst1) (length lst2))
       (equal? (filter (lambda (x) (member x lst2)) lst1) lst1)))

;; test -> bool
;; sprawdza czy wynik testu jest rowny z przewidywanym wynikiem
(define (check-exp test)
  (let ([test-case (car test)]
        [test-outcome (cdr test)])
    (same-members? (hole-context test-case) test-outcome)))

;; testy sa parami (test, wynik testu)
;;'(test-case . outcome)
(define t1 (cons '(+ 3 hole) '()))
(define t2 (cons '(let (x 3) (let (y 7) (+ x hole))) '(y x)))
(define t3 (cons '(let (x 3) (let (y hole) (+ x 3))) '(x)))
(define t4 (cons '(let (x hole) (let (y 7) (+ x 3))) '()))
(define t5 (cons '(let (piesek  1)                    
                    (let (kotek  7)
                      (let (piesek  9)
                        (let (chomik  5)
                          hole))))
                 '(chomik piesek kotek)))
(define t6 (cons '(+ (let (x 4) 5) hole) '()))

(define testlist (list t1 t2 t3 t4 t5 t6))

(define (test)
  (andmap check-exp testlist))

(test)