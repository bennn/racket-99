#lang racket

(require rackunit
         "9.rkt")

(check-equal? (my-pack empty) empty)
(check-equal? (my-pack (list 1)) (list (list 1)))
(check-equal? (my-pack (list 1 3 5 9)) (list (list 1) (list 3) (list 5) (list 9)))
(check-equal? (my-pack (list 1 1 2)) (list (list 1 1) (list 2)))
(check-equal? (my-pack (list 1 1 2 2 1 1 3 3 3 3 1 3 2 9)) (list (list 1 1) (list 2 2) (list 1 1 ) (list 3 3 3 3) (list 1) (list 3) (list 2) (list 9)))

