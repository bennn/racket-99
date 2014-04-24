#lang racket

(define (naive-loop i n p)
  (if (< i n)
      (if (= 0 (modulo p i))
          #f
          (naive-loop (add1 i) n p))
      #t))

(define (is-prime n)
  (match n
    [0 #f]
    [1 #f]
    [2 #t]
    [n (if (< n 0) #f (naive-loop 2 (sub1 n) n))]))

(provide is-prime)
