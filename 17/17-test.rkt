#lang racket

(require rackunit
         "17.rkt")

(check-equal? (my-split empty 0) (list empty empty))
(check-equal? (my-split empty 5) (list empty empty))
(check-equal? (my-split (list 1) 0) (list empty (list 1)))
(check-equal? (my-split (list 1) 1) (list (list 1) empty ))
(check-equal? (my-split (list 1 2) 0) (list empty (list 1 2)))
(check-equal? (my-split (list 1 2) 1) (list (list 1) (list 2)))
(check-equal? (my-split (list 1 2) 2) (list (list 1 2) empty ))
(check-equal? (my-split (list 1 2 3 4 5 6 7 8) 3) (list (list 1 2 3) (list 4 5 6 7 8)))
