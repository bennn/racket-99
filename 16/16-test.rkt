#lang racket

(require rackunit
         "16.rkt")

(check-equal? (my-drop empty 1) empty)
(check-equal? (my-drop empty 10) empty)
(check-equal? (my-drop (list 1 2 3 5) 10) (list 1 2 3 5))
(check-equal? (my-drop (list 1 2 3 5) 1) empty)
(check-equal? (my-drop (list 1 2 3 4 5 6 7) 3) (list 1 2 4 5 7))
(check-equal? (my-drop (list 1 2 1 2 1 2 1) 2) (list 1 1 1 1))
