#lang racket

(require rackunit
         "2.rkt")

(check-equal? empty (my-but-last empty))
(check-equal? empty (my-but-last (cons 1 empty)))
(check-equal? (list 2 1) (my-but-last (cons 2 (cons 1 empty))))
(check-equal? (list 2 3) (my-but-last (list 1 2 3)))
(check-equal? (list 98 99) (my-but-last (list 1 2 3 4 6 8 012 98 99)))
