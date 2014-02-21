#lang racket

(require rackunit
         "18.rkt")

;; (check-equal? (my-slice empty 0 0) empty)
(check-equal? (my-slice (list 1 234 5 6 7 8) 2 5) (list 234 5 6 7))
(check-equal? (my-slice (list 1 1 2 3 1 4 6 7 8) 8 9) (list 7 8))
(check-equal? (my-slice (list 3 2 1) 1 1) (list 3))
(check-equal? (my-slice (list 3 2 1) 1 2) (list 3 2))
