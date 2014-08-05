#lang racket

(require rackunit
         "1.rkt")

(check-equal? 0 (my-last empty))
(check-equal? 1 (my-last (list 1)))
(check-equal? 1 (my-last (list 2 1)))
(check-equal? 4 (my-last (list 2 1 3 2 1 0 4)))
(check-equal? 99 (my-last (cons (list 1 1 1) (list 2 1 99))))

