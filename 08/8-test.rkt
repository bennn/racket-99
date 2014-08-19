#lang racket

(require rackunit
         "8.rkt")

(check-equal? (my-compress empty) empty)
(check-equal? (my-compress (list 1 2 3 4)) (list 1 2 3 4))
(check-equal? (my-compress (list 1 1 2 3 5)) (list 1 2 3 5))
(check-equal? (my-compress (list (list 1 2 3) (list 1 2 3) 4)) (list (list 1 2 3) 4))
(check-equal? (my-compress (list 8 8 9 8 8 6 8 8 8 8)) (list 8 9 8 6 8))


