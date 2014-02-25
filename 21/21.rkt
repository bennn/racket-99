#lang racket

(define (my-insert x xs i)
  (if (< i 1)
    (cons x xs)
    (if (empty? xs)
      empty
      (cons (car xs) (my-insert x (cdr xs) (sub1 i))))))

(provide my-insert)
