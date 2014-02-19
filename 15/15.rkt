#lang racket

(define (my-repli-aux x i)
  (if (= 0 i)
    empty
    (cons x (my-repli-aux x (sub1 i)))))

(define (my-repli xs i)
  (if (empty? xs)
    empty
    (append (my-repli-aux (car xs) i) (my-repli (cdr xs) i))))

(provide my-repli)
