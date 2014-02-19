#lang racket
;; duplicate elements of list

(define (my-duplicate xs)
  (if (empty? xs)
      empty
      (cons (first xs) (cons (first xs) (my-duplicate (rest xs))))))

(provide my-duplicate)
