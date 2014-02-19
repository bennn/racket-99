#lang racket

(require rackunit
         "14.rkt")

(check-equal? (my-duplicate empty) empty)
(check-equal? (my-duplicate (list 1)) (list 1 1))
(check-equal? (my-duplicate (list 2 3 1 88 8 8)) (list 2 2 3 3 1 1 88 88 8 8 8 8))
(check-equal? (my-duplicate (list (list 1 2 3))) (list (list 1 2 3) (list 1 2 3)))
(check-equal? (my-duplicate (list 1111 11 111)) (list 1111 1111 11 11 111 111))
