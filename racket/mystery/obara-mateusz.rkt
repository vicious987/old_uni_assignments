#lang racket

(require racklog)

;; transpozycja tablicy zakodowanej jako lista list
(define (transpose xss)
  (cond [(null? xss) xss]
        ((null? (car xss)) (transpose (cdr xss)))
        [else (cons (map car xss)
                    (transpose (map cdr xss)))]))

;; procedura pomocnicza
;; tworzy listę n-elementową zawierającą wyniki n-krotnego
;; wywołania procedury f
(define (repeat-fn n f)
  (if (eq? 0 n) null
      (cons (f) (repeat-fn (- n 1) f))))

;; tworzy tablicę n na m elementów, zawierającą świeże
;; zmienne logiczne
(define (make-rect n m)
  (repeat-fn m (lambda () (repeat-fn n _))))

;; predykat binarny
;; (%row-ok xs ys) oznacza, że xs opisuje wiersz (lub kolumnę) ys
(define %decrement
  (%rel (x x_less_one)
        [(x x_less_one)
         (%is x_less_one (- x 1))]))

(define %greater_than_0
  (%rel (x)
        [(x)
         (%> x 0)]))

(define %row-ok
  (%rel (lens lens-head lens-tail row row-head row-tail lens-head--)
        [(lens (cons '_ row-tail))
         (%row-ok lens row-tail)]
        [((cons lens-head lens-tail) (cons '* row-tail))
         (%greater_than_0 lens-head)
         (%decrement lens-head lens-head--)
         (%row-ok (cons lens-head-- lens-tail) row-tail)]
        [((cons '_ lens-tail) (cons '_ row-tail))
         (%row-ok lens-tail row-tail)]
        [((cons '_ null) null)]
        [(null row)
         (%row-ok (cons '_ null) row)]
    ))

;; funkcja rozwiązująca zagadkę
(define (solve rows cols)
  (define board (make-rect (length cols) (length rows)))
  (define tboard (transpose board))
  (define ret (%which (xss) 
                      (%= xss board)
;; TODO: uzupełnij!
                      ))
  (and ret (cdar ret)))

;; testy
(equal? (solve '((2) (1) (1)) '((1 1) (2)))
        '((* *)
          (_ *)
          (* _)))

(equal? (solve '((2) (2 1) (1 1) (2)) '((2) (2 1) (1 1) (2)))
        '((_ * * _)
          (* * _ *)
          (* _ _ *)
          (_ * * _)))
;; TODO: możesz dodać własne testy


