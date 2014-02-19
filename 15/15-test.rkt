#lang racket

(require rackunit
         "15.rkt")

(check-equal? (my-repli empty 0) empty)
(check-equal? (my-repli empty 10) empty)
(check-equal? (my-repli (list 1 2) 1) (list 1 2))
(check-equal? (my-repli (list 3 3 1 2) 1) (list 3 3 1 2))
(check-equal? (my-repli (list 1 2) 5) (list 1 1 1 1 1 2 2 2 2 2))
(check-equal? (my-repli (list 1 2 3) 2) (list 1 1 2 2 3 3))

