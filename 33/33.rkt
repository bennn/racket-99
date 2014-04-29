#lang racket

(require "../32/32.rkt")

(define (coprime n m)
  (= 1 (my-gcd-cond n m)))

(provide coprime)
