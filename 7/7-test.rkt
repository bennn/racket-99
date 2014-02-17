#lang racket

(require rackunit
         "7.rkt")

(check-equal? empty (my-flatten empty))
(check-equal? (list 1) (my-flatten (list (list 1))))
(check-equal? (list 1 2 2 3 3 4) (my-flatten (list (list 1 2) (list 2 3) (list 3 4))))
;; contract violation, not a list ;; (check-equal? (list 1 2 3) (my-flatten (list 1 2 3)))
(check-equal? (list 1 8 9 1 2 2 3 1 3 3) (my-flatten (list (list 1 8 9 1) (list 2 2 3 1) (list 3 3))))

