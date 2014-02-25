#lang racket

(require rackunit
         "20.rkt")

(check-equal? (my-remove empty 0) empty)
(check-equal? (my-remove empty 9) empty)
(check-equal? (my-remove (list 1 2 3) 0) (list 2 3))
(check-equal? (my-remove (list 1 2 3) 1) (list 1 3))
(check-equal? (my-remove (list 1 2 3) 2) (list 1 2))
(check-equal? (my-remove (list 1 2 3) 3) (list 1 2 3))
