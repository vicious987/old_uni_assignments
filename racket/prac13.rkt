#lang racket
(require racklog)

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
        [(lens (cons 0 row-tail))
         (%row-ok lens row-tail)]
        [((cons lens-head lens-tail) (cons 1 row-tail))
         (%greater_than_0 lens-head)
         (%decrement lens-head lens-head--)
         (%row-ok (cons lens-head-- lens-tail) row-tail)]
        [((cons 0 lens-tail) (cons 0 row-tail))
         (%row-ok lens-tail row-tail)]
        [((cons 0 null) null)]
        [(null row)
         (%row-ok (cons 0 null) row)]
    ))

#|
(define %row-ok
  (%rel (lens lens-head lens-tail row row-head row-tail lens-head--)
        [(lens (cons 0 row-tail))
         (%row-ok lens row-tail)]
        [((cons lens-head lens-tail) (cons 1 row-tail))
         (%greater_than_0 lens-head)
         (%decrement lens-head lens-head--)
         (%row-ok-rest (cons lens-head-- lens-tail) row-tail)]
        [((cons 0 null) null)]
        [(null row)
         (%row-ok (cons 0 null) row)]

                ))

(define %row-ok-rest
  (%rel (lens lens-head lens-tail row row-head row-tail lens-head--)
        [((cons 0 null) row)
         (%row-ok (cons 0 null) row)]
        [((cons 0 lens-tail) (cons 0 row-tail))
         (%row-ok lens-tail row-tail)]
        [((cons lens-head lens-tail) (cons 1 row-tail))
         (%greater_than_0 lens-head)
         (%decrement lens-head lens-head--)
         (%row-ok-rest (cons lens-head-- lens-tail) row-tail)]))
|#
        
        

(define test1-lens (list 2 4))
(define test1-row (list 1 1 0 0 1 1 1 1 0 0))

(define test2-lens (list))
(define test2-row (list 0))


(%which () (%row-ok test1-lens test1-row))