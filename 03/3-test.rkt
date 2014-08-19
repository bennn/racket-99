#lang racket

(require rackunit
         "3.rkt")

(check-equal? (element-at empty 5) empty)
(check-equal? (element-at (list 1 3) 5) empty)
(check-equal? (element-at (list 3) 5) empty)
(check-equal? (element-at (list 1 2 3 4 5 6) 5) 6)
(check-equal? (element-at (list 1 2 5) 1) 2)
(check-equal? (element-at (list 1 2 5) 0) 1)

(check-equal? (element-at-match empty 5) empty)
(check-equal? (element-at-match (list 1 3) 5) empty)
(check-equal? (element-at-match (list 3) 5) empty)
(check-equal? (element-at-match (list 1 2 3 4 5 6) 5) 6)
(check-equal? (element-at-match (list 1 2 5) 1) 2)
(check-equal? (element-at-match (list 1 2 5) 0) 1)

;; (check-equal? (element-at-fold empty 5) empty)
;; (check-equal? (element-at-fold (list 1 3) 5) empty)
;; (check-equal? (element-at-fold (list 3) 5) empty)
;; (check-equal? (element-at-fold (list 1 2 3 4 5 6) 5) 6)
;; (check-equal? (element-at-fold (list 1 2 5) 1) 2)
;; (check-equal? (element-at-fold (list 1 2 5) 0) 1)
