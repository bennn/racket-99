#lang racket

(require "../34/34.rkt"
         "../36/36.rkt")

(define (my-phi-aux factors acc)
  (match factors
    ['() acc]
    [(cons (cons p m) t) (my-phi-aux t (* acc (* (sub1 p) (expt p (sub1 m)))))]))

(define (my-phi n)
  (my-phi-aux (my-prime-factors-mult n) 1))

(provide my-phi)
