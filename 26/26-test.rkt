#lang racket

(require rackunit
         "26.rkt")

(check-equal? (my-combination 0 empty) (list empty))
(check-equal? (my-combination 1 empty) empty)
(check-equal? (my-combination 0 (list 1 2 3)) (list empty))
; (check-equal? (my-combination 1 (list 1 2 3)) (list (list 1) (list 2) (list 3)))
; (check-equal? (my-combination 1 (list 4 10 2)) (list (list 4) (list 10) (list 2)))
; (check-equal? (my-combination 2 (list 1 2 3)) (list (list 1 2) (list 2 3) (list 1 3)))
; (check-equal? (my-combination 3 (list 1 2 3)) (list (list 1 2 3)))
