#lang racket

(require rackunit
         "11.rkt")

(check-equal? (my-encode2 empty) empty)
(check-equal? (my-encode2 (list 1 2 3)) (list 1 2 3))
(check-equal? (my-encode2 (list 1 1 1)) (list (list 3 1)))
(check-equal? (my-encode2 (list 1 1 1 1 2 3 3 1 1 4 5 5 5 5)) (list (list 4 1) 2 (list 2 3) (list 2 1) 4 (list 4 5)))
