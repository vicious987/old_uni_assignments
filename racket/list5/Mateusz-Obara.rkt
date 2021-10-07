#lang racket
;;Mateusz Obara, zadanie 6 z listy 5
(define (var? t)
  (symbol? t))
;;neg
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

(define (free-vars f)
  (if (var? f)
      (list f)
      (cond
        [(neg? f) (free-vars (neg-subf f))]
        [(conj? f) (append (free-vars (conj-left f)) (free-vars (conj-right f)))]
        [(disj? f) (append (free-vars (disj-left f)) (free-vars (disj-right f)))])))

;;zadanie 6
(define (clause? f)
  (or
    (var? f)
    (and (neg? f) (var? (neg-subf f)))
    (and (disj? f) (clause? (disj-left f)) (clause? (disj-right f)))))

(define (cnf? f)
  (or
   (clause? f)
   (and (conj? f)
        (cnf? (conj-left f))
        (cnf? (conj-right f)))))

(define (disj-mrg list1 list2)
  (foldl append '() (map (lambda (i) (map (lambda (j) (list j i)) list1)) list2)))


;; nasz cnf to lista klauzul, gdzie każda klauzula dowolnie ponawiasowaną alternatywą literałów
(define (to-cnf f)
  (cond
    [(clause? f) (list (free-vars f))]
    [(conj? f) (append (to-cnf (conj-left f))
                       (to-cnf (conj-right f)))]
    [(disj? f) (disj-mrg (to-cnf (disj-left f))
                         (to-cnf (disj-right f)))]))
                                                            ; dla wygody klauzule jednoelementowe wypisuje tu jako swoje jedyne elementy ([a] = a)
(define t1 (make-disj (make-conj 'a 'b) (make-conj 'c 'd))) ; (a ^ b) v (c ^ d) -> [ [a c] [a d] [b c] [b d] ]
(define t2 (make-disj (make-disj 'a 'b) (make-disj 'c 'd))) ; (a ^ b) ^ (d ^ e) -> [ [a b c d] ]
(define t3 (make-conj (make-conj 'a 'b) (make-conj 'c 'd))) ; (a v b) v (c v d) -> [ a b c d ]
(define t4 (make-disj t1 t2))
;(define t5 (make-disj t1 t3))


(to-cnf t1)
(to-cnf t2)
(to-cnf t3)
(to-cnf t4)
;(to-cnf t5)