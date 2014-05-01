#lang racket

(require rackunit
         "27.rkt")

(check-equal? (pairwith 1 '()) '())
(check-equal? (pairwith 1 (list 1 2 3)) (list (cons 1 3) (cons 1 2) (cons 1 1)))
(check-equal? (pairwith 9 (list 4 1 1 2 3)) (list (cons 9 3) (cons 9 2) (cons 9 1) (cons 9 1) (cons 9 4)))

