#lang racket

(require rackunit
         "24.rkt")

(define (check-cond i j)
  (let ([r (my-lotto i j)])
    (check-equal? (length r) i)
    (map (lambda (x) (check-equal? (<= x j) '#t)) r) '()))

(check-equal? (check-cond 0 0) '())
(check-equal? (check-cond 3 10) '())
(check-equal? (check-cond 10 10) '())
(check-equal? (check-cond 5 8) '())
