#lang racket

(require rackunit
         "3.rkt")

(check-equal? empty (element-at empty 5))
(check-equal? empty (element-at (list 1 3) 5))
(check-equal? empty (element-at (list 3) 5))
(check-equal? 6 (element-at (list 1 2 3 4 5 6) 5))
(check-equal? 2 (element-at (list 1 2 5) 1))
(check-equal? 1 (element-at (list 1 2 5) 0))
