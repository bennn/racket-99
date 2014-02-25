#lang racket

(define (my-range-inc i j)
  (if (= i j)
    (list i)
    (cons i (my-range (add1 i) j))))

(define (my-range-dec i j)
  (if (= i j)
    (list i)
    (cons i (my-range (sub1 i) j))))

(define (my-range i j)
  (if (< i j)
    (my-range-inc i j)
    (my-range-dec i j)))

(provide my-range)
