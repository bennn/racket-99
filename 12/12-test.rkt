#lang racket

(require rackunit
         "12.rkt")

(check-equal? (my-decode empty) empty)
(check-equal? (my-decode (list 1 2 3)) (list 1 2 3))
(check-equal? (my-decode (list (list 3 1))) (list 1 1 1))
(check-equal? (my-decode (list (list 4 1) 2 (list 2 3) (list 2 1) 4 (list 4 5))) (list 1 1 1 1 2 3 3 1 1 4 5 5 5 5))
