#lang racket
;Mateusz Obara, lista 2, ćwiczenie 11 (pracownia cz. 2)
(define (dist x y)
  (abs (- x y)))

(define (close-enough? x y)
  (< (dist x y) 0.00001))

(define (fix-point f x0)
  (let ((x1 (f x0)))
    (if (close-enough? x0 x1)
        x0
        (fix-point f x1))))

(define (average-damp f)
  (lambda (x) (/ (+ x (f x)) 2)))

(define (compose x y)
  (lambda (arg) (x (y arg))))

(define (repeated proc times)
  (if (< times 2)
      (identity proc)
      (compose proc (repeated proc (- times 1)))))

(define (nth-root n damplvl x)
  (let ([rootproc (lambda(z) (/ x (expt z (- n 1))))])
    (fix-point ((repeated average-damp damplvl) rootproc) 1.0)))

(nth-root 2 1 (expt 10 2)) ;działa
(nth-root 3 1 (expt 10 3)) ;działa
;(nth-root 4 1 (expt 10 4)) ;tu już nam się program zapętli, spróbujmy podnieść damplvl
(nth-root 4 2 (expt 10 4)) ;działa!
(nth-root 5 2 (expt 10 5)) ;działa
(nth-root 6 2 (expt 10 6)) ;działa
(nth-root 7 2 (expt 10 7)) ;działa
;(nth-root 8 2 (expt 10 8)) ;ponownie się zapętla
(nth-root 8 3 (expt 10 8)) ;po zwiekszeniu dmplvl znów działa
(nth-root 15 3 (expt 10 16)) ;zakończy się, ale przybliżenie już nie jest takie dobre
(nth-root 15 4 (expt 10 16)) ;zwiekszenie dmplvl nie poprawia nam przybliżenia
;(nth-root 16 3 (expt 10 16)) ;i znów nam się zapętla
(nth-root 16 4 (expt 10 16)) ;po zwiększaniu dmplvl działa
;Wniosek: aby obliczyć pierwiastek stopnia n dowolnej liczby za pomocą tłumienia przez uśrednianie,
;musimy użyć conajmniej podłoga((log n))-tego tłumienia. Nie gwarantuje to nam dobrego przybliżenia przy punkcie startowym 1.0.