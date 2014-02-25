#lang racket

(require rackunit
         "22.rkt")

(check-equal? (my-range 0 1) (list 0 1))
(check-equal? (my-range 1 0) (list 1 0))
(check-equal? (my-range 4 6) (list 4 5 6))
(check-equal? (my-range 6 4) (list 6 5 4))
(check-equal? (my-range 0 6) (list 0 1 2 3 4 5 6))
