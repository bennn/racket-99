#lang racket

(define (my-slice xs i k)
  (if (= 1 i)
    (if (= 0 k)
      empty
      (cons (car xs) (my-slice (cdr xs) i (sub1 k))))
    (my-slice (cdr xs) (sub1 i) (sub1 k))))

(provide my-slice)
