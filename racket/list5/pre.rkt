#lang racket

(define (var? t)
  (symbol? t))

(define (neg? t)
  (and
   (list? t)
   (= 2 (length t))
   (eq? 'neg (car t))))
;;and
(define (conj? t) 
  (and
   (list? t)
   (= 3 (length t))
   (eq? 'conj (car t))))
;;or
(define (disj? t)
  (and
   (list? t)
   (= 3 (length t))
   (eq? 'disj (car t))))

;;zad1
;;konstruktory
(define (make-neg a)
  (if (neg? a)
      a
      (list 'neg a)))

(define (make-conj l r)
  (list 'conj l r))

(define (make-disj l r)
  (list 'disj l r))
;;selektory
(define (neg-subf x)
  (second x))

(define (conj-left x)
  (second x))

(define (conj-right x)
  (third x))

(define (disj-left x)
  (second x))

(define (disj-right x)
  (third x))

(define (prop? f)
  (or
   (var? f)
   (and (neg? f) (prop? (neg-subf f)))
   (and (disj? f) (prop? (disj-left f)) (prop? (disj-right f)))
   (and (conj? f) (prop? (conj-left f)) (prop? (conj-right f)))))
;; zad2
;;formula -> list
(define (free-vars f)
  (if (var? f)
      (list f)
      (cond
        [(neg? f) (free-vars (neg-subf f))]
        [(conj? f) (append (free-vars (conj-left f)) (free-vars (conj-right f)))]
        [(disj? f) (append (free-vars (disj-left f)) (free-vars (disj-right f)))])))

(define a (make-conj 'conj1 'conj2))
(define b (make-disj 'disj1 'disj2))
(define negb (make-neg b))
(define ai~b (make-conj a negb))


;; zad3
(define (gen-vals  xs)
  (if (null? xs)
      (list  null)
      (let* ((vss   (gen-vals (cdr xs)))
             (x     (car xs))
             (vst   (map(lambda (vs) (cons (list x true)   vs)) vss))
             (vsf   (map(lambda (vs) (cons (list x false) vs)) vss)))
        (append  vst  vsf))))
;; etykieta w pierwszym el
(define (get-val lst key)
  (if (null? (filter (lambda (x) (equal? key (car x))) lst))
      (error "value not found")
      (cadar (filter (lambda (x) (equal? key (car x))) lst))))

(define (eval-formula f eval)
      (cond
        [(var? f) (get-val eval f)]
        [(neg? f) (not (eval-formula (neg-subf f) eval))]
        [(conj? f) (and (eval-formula (conj-left f) eval) (eval-formula (conj-right f) eval))]
        [(disj? f) (or (eval-formula (disj-left f) eval) (eval-formula (disj-right f) eval))]))

(define (falsifable f)
  (let ([list-of-evals (gen-vals (free-vars f))])
    (filter (lambda (x) (equal? (eval-formula f x) #f))  list-of-evals)))



(define eval1 (list (list 'a #t) (list 'b #f)))
(define form1 (make-conj 'a 'b))

;(eval-formula form1 eval1)

;(first (falsifable form1))

;;zadanie4

(define (literal? x)
  (or
   (var? x)
   (and (neg? x) (var? (neg-subf x)))))

(define (nnf? f)
  (cond
    [(literal? f) #t]
    [(neg? f) #f]
    [(conj? f) (and (nnf? (conj-left f)) (nnf? (conj-right f)))]
    [(disj? f) (and (nnf? (disj-left f)) (nnf? (disj-right f)))]
))

(define 4test1 (make-neg (make-conj 'p 'q)))
(define 4test2 (make-conj (make-conj (make-neg 'p) 'q) 'a))

(nnf? 4test1)
(nnf? 4test2)

(define (to-nnf1 f)
  (cond
    [(literal? f) f]
    [(conj? f) (make-disj (make-neg (disj-left f)) (make-neg (disj-right f)))]
    [(disj? f) (make-conj (make-neg (disj-left f)) (make-neg (disj-right f)))]))
;;^ zrob to w 2 wzajemnie rekurencyjnych funkcjach
