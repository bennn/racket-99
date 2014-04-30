#lang racket

(require "../33/33.rkt"
         "../31/31.rkt")

(define (multiplicity divisor n)
  (let ([quotient (/ n divisor)])
    (if (integer? quotient) (add1 (multiplicity divisor quotient)) 0)))

(define (my-prime-factors-mult n)
  (cond [(< n 2) empty]
        [else (stream-fold (lambda (acc x) (if (and (is-prime x) (not (coprime n x)))
                                               (cons (cons x (multiplicity x n)) acc)
                                               acc))
                           empty (in-range (add1 n) 1 -1))]))

(provide my-prime-factors-mult)
