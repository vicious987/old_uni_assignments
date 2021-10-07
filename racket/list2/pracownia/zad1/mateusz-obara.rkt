#lang racket
;Mateusz Obara, lista 2, ćwiczenie 10 (pracownia cz. 1)
(define (dist x y)
  (abs (- x y)))

(define (close-enough? x y)
  (< (dist x y) 0.00001))

(define (nseries n x)
  (let ([n1 (- n 1)])
    (if (= n 1)
        x
        (* (* n1 n1) (* x x)))))

(define (dseries n)
  (- (* n 2) 1))

(define (fseries-iter a_seclast a_last b_seclast b_last f_seclast f_last index x)
  (let ([a_new_last (+ (* a_last (dseries (+ 1 index))) (* a_seclast (nseries (+ index 1) x)))]
        [b_new_last (+ (* b_last (dseries (+ 1 index))) (* b_seclast (nseries (+ index 1) x)))])
        (if (close-enough? f_seclast f_last)
            f_last
            (fseries-iter a_last a_new_last b_last b_new_last f_last (/ a_new_last b_new_last) (+ 1 index) x))))

(define (f x)        ;w naszej procedurze pamiętamy ostatnie i przedostatnie wyrazy ciągów
  (let ([a1 x]       ;zaczynając od f1 i f2.
        [a2 (* 3 x)] ;zatem ciągi a i b powinniśmy również liczyć od wyrazu 1 i 2, a nie od -1 i 0
        [b1 1]       ;wyliczamy je ręcznie i z nimi zaczynamy procedurę
        [b2 (+ 3 (* x x))])
    (let ([f1 x]
          [f2 (/ a2 b2)])
      (fseries-iter a1 a2 b1 b2 f1 f2 2 x))))

(f 2.0)
(atan 2.0)
(writeln "test1 dla 2.0 : wartosci podobne")
(f 0.0)
(atan 0.0)
(writeln "test2 dla 0.0 : wartosci podobne")
(f 3.14)
(atan 3.14)
(writeln "test3 dla 3.14 : wartosci podobne")
(f 0.001)
(atan 0.001)
(writeln "test4 dla 0.001 : wartosci podobne")
(f -3.14)
(atan -3.14)
(writeln "test5 dla -3.14 : wartosci podobne")
;(f 50.0) ;
;(atan 50.0)
;(writeln "test4 dla 50.0 : nasz algorytm działa za wolno")