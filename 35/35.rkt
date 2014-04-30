#lang racket

(require "../33/33.rkt"
         "../31/31.rkt")

;; Slightly incorrect: list has no duplicates
(define (my-prime-factors n)
  (cond [(< n 2) empty]
        [else (stream-fold (lambda (acc x) (if (and (is-prime x) (not (coprime n x))) (cons x acc) acc)) empty (in-range (add1 n) 1 -1))]))

(provide my-prime-factors)
