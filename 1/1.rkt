#lang racket
;; Find the last box in a list

(define (my-last-acc prev xs)
  (if (empty? xs)
      prev
      (my-last-acc (first xs) (rest xs))))

(define (my-last xs)
  (if (empty? xs)
      0
      (my-last-acc (first xs) (rest xs))))
  
(provide my-last)
