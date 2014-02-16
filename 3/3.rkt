#lang racket
;; nth element

(define (element-at xs i)
  (if (empty? xs)
      empty
      (if (= 0 i)
          (first xs)
          (element-at (rest xs) (sub1 i)))))

(provide element-at)
