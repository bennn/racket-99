#lang racket

(define (my-split xs i)
  (if (empty? xs)
    (list empty empty)
    (if (< i 1)
      (list empty xs)
      (let ([ys (my-split (cdr xs) (sub1 i))])
        (list (cons (car xs) (car ys)) (car (cdr ys)))))))

(provide my-split)
