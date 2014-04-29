#lang racket

(define (my-gcd-if n m)
  (if (zero? n) m
  (if (zero? m) n
  (if (< n m) (my-gcd-if (- m n) n)
              (my-gcd-if (- n m) m)))))

(define (my-gcd-cond n m)
  (cond [(zero? n) m]
        [(zero? m) n]
        [(< n m) (my-gcd-cond (- m n) n)]
        [else (my-gcd-cond (- n m) m)]))

(provide my-gcd-if
         my-gcd-cond)
