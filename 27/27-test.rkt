#lang racket

(require rackunit
         "27.rkt")

(check-equal? (pairwith 1 '()) '())
(check-equal? (pairwith 1 (list 1 2 3)) (list (cons 1 3) (cons 1 2) (cons 1 1)))
(check-equal? (pairwith 9 (list 4 1 1 2 3)) (list (cons 9 3) (cons 9 2) (cons 9 1) (cons 9 1) (cons 9 4)))

(check-equal? (groupwith 1 '()) '())
(check-equal? (groupwith 1 (list (list 1) (list 2) (list 3))) (list (list 1 3) (list 1 2) (list 1 1)))
(check-equal? (groupwith 9 (list (list 4 1) (list 1 2) (list 3))) (list (list 9 3) (list 9 1 2) (list 9 4 1)))
