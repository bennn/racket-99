#lang racket

(require "../33/33.rkt")

(define (my-totient-aux x i acc)
  (cond [(= x i) acc]
        [(coprime x i) (my-totient-aux x (add1 i) (add1 acc))]
        [else (my-totient-aux x (add1 i) acc)]))

(define (my-totient x)
  (cond [(< x 1) 0]
        [(= x 1) 1]
        [else (my-totient-aux x 1 0)]))

(define (my-totient-range x)
  (cond [(< x 1) 0]
        [(= x 1) 1]
        [else (stream-fold (lambda (acc y) (+ acc (if (coprime x y) 1 0))) 0 (in-range 1 x))]))

(provide my-totient
         my-totient-range)
