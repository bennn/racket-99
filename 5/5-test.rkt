#lang racket

(require rackunit
         "5.rkt")

(check-equal? empty (my-rev empty))
(check-equal? (list 1) (my-rev (list 1)))
(check-equal? (list 8 3 1) (my-rev (list 1 3 8)))
(check-equal? (list 3 3 3 1) (my-rev (list 1 3 3 3)))
(check-equal? (list 7 99 empty empty empty empty empty empty empty 1) (my-rev (list 1 empty empty empty empty empty empty empty 99 7)))
