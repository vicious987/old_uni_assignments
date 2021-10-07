#lang racket

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
;; klauzula -> list ;; free-vars
#|
(define (to-cnf f)
  (cond
    ;;przypadek bazowy
    [(clause? f) (free-vars f)]
    ;; ^ and klauz/cnfie i nie klauz/cnfie
    [(conj? f) (make-conj (to-cnf (conj-left f))
                          (to-cnf (conj-right f)))]
    [(disj? f) (merge-cnf (to-cnf (disj-left f))
                          (to-cnf (disj-right f)))]
    [(disj? f) (to-cnf (
|#

(define tl1 (list 'a 'b 'c))
(define tl2 (list 'd 'e 'f))

(define (disj-mrg list1 list2)
  (foldl append '() (map (lambda (i) (map (lambda (j) (list j i)) tl1)) tl2)))



(define (to-cnf f)
  (cond
    [(clause? f) (free-vars f)]
    [(conj? f) (append (to-cnf (conj-left f))
                       (to-cnf (conj-right f)))]
    [(disj? f) (disj-mrg (to-cnf (disj-left f))
                         (to-cnf (disj-right f)))]))

(define t1 (make-disj (make-conj 'a 'b) (make-conj 'c 'd)))

(to-cnf t1)