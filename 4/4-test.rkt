#lang racket

(require rackunit
         "4.rkt")

(check-equal? 0 (my-length empty))
(check-equal? 1 (my-length (list 1)))
(check-equal? 3 (my-length (list 1 3 8)))
(check-equal? 4 (my-length (list 1 3 3 3)))
(check-equal? 10 (my-length (list 1 empty empty empty empty empty empty empty 99 7)))

