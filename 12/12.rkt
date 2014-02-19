#lang racket
;; decode a run-length encoded list

(define (repeat i x xs)
  (if (equal? i 0)
      xs
      (repeat (sub1 i) x (cons x xs))))

(define (my-decode xs)
  (if (empty? xs)
      empty
      (if (list? (first xs))
          (append (repeat (first (first xs)) (first (rest (first xs))) empty) (my-decode (rest xs)))
          (cons (first xs) (my-decode (rest xs))))))
      
(provide my-decode)
