#lang racket

(require rackunit
         "19.rkt")

;; straightforward
(check-equal? (my-rotate empty 0) empty)
(check-equal? (my-rotate (list 1 2 3) 1) (list 2 3 1))
(check-equal? (my-rotate (list 1 2 3 4 5 6 7) 5) (list 6 7 1 2 3 4 5))
(check-equal? (my-rotate (list 4 3 3 4) 10) (list 3 4 4 3))
(check-equal? (my-rotate (list 1 2 3 4 5) -1) (list 5 1 2 3 4))

;; Error conditions
(check-equal? (my-rotate empty 3) empty)
(check-equal? (my-rotate (list 1) 3) (list 1))
