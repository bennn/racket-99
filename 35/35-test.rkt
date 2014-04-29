#lang racket

(require rackunit
         "35.rkt")

(check-equal? (my-prime-factors -91) empty)
(check-equal? (my-prime-factors 1) empty)
(check-equal? (my-prime-factors 2) (list 2))
(check-equal? (my-prime-factors 5) (list 5))
(check-equal? (my-prime-factors 315) (list 3 5 7))
(check-equal? (my-prime-factors 17) (list 17))
(check-equal? (my-prime-factors 123) (list 3 41))
(check-equal? (my-prime-factors 42) (list 2 3 7))
(check-equal? (my-prime-factors 131) (list 131))
(check-equal? (my-prime-factors 99) (list 3 11))
(check-equal? (my-prime-factors 5412) (list 2 3 11 41))
