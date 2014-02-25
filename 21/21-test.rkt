#lang racket

(require rackunit
         "21.rkt")

(check-equal? (my-insert 4 empty 0) (list 4))
(check-equal? (my-insert 4 empty 2) empty)
(check-equal? (my-insert 4 (list 1 2 3) 0) (list 4 1 2 3))
(check-equal? (my-insert 4 (list 1 2 3) 1) (list 1 4 2 3))
(check-equal? (my-insert 4 (list 1 2 3) 2) (list 1 2 4 3))
(check-equal? (my-insert 4 (list 1 2 3) 3) (list 1 2 3 4))
