#lang racket

(define (my-remove xs k)
  (if (empty? xs)
    empty
    (if (< k 1)
      (cdr xs)
      (cons (car xs) (my-remove (cdr xs) (sub1 k))))))

(provide my-remove)
