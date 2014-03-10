#lang racket

(define (my-gcd n m)
  (if (zero? n) m
  (if (zero? m) n
  (if (< n m) (my-gcd (- m n) n)
              (my-gcd (- n m) m)))))

(provide my-gcd)
