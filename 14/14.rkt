#lang racket
;; duplicate elements of list

(define (my-duplicate xs)
  (if (empty? xs)
      empty
      (cons (car xs) (cons (car xs) (my-duplicate (cdr xs))))))

(provide my-duplicate)
