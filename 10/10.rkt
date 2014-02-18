#lang racket
;; length encoding

(define (my-encode-aux i prev xs)
  (if (empty? xs)
      (list (list i prev))
      (if (equal? prev (first xs))
          (my-encode-aux (add1 i) prev (rest xs))
          (cons (list i prev) (my-encode-aux 1 (first xs) (rest xs))))))

(define (my-encode xs)
  (if (empty? xs)
      empty
      (my-encode-aux 1 (first xs) (rest xs))))

(provide my-encode)
