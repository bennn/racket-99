#lang racket

(require rackunit
         "10.rkt")

(check-equal? (my-encode empty) empty)
(check-equal? (my-encode (list 1 2 3)) (list (list 1 1) (list 1 2) (list 1 3)))
(check-equal? (my-encode (list 1 1 1)) (list (list 3 1)))
(check-equal? (my-encode (list 1 1 1 1 2 3 3 1 1 4 5 5 5 5)) (list (list 4 1) (list 1 2) (list 2 3) (list 2 1) (list 1 4) (list 4 5)))
