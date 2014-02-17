#lang racket

(define (my-append xs ys)
  (if (empty? xs)
      ys
      (cons (first xs) (my-append (rest xs) ys))))

(define (my-flatten-aux xs ys)
  (if (empty? xs)
      ys
      (my-append (first xs) (my-flatten-aux (rest xs) ys))))

(define (my-flatten xs)
  (my-flatten-aux xs empty))

(provide my-flatten)
