#lang racket
;; modified length encoding

(define (my-encode-aux i prev xs)
  (if (empty? xs)
      (if (equal? 1 i)
          (list prev)
          (list (list i prev)))
      (if (equal? prev (first xs))
          (my-encode-aux (add1 i) prev (rest xs))
          (if (equal? i 1)
              (cons prev (my-encode-aux 1 (first xs) (rest xs)))
              (cons (list i prev) (my-encode-aux 1 (first xs) (rest xs)))))))

(define (my-encode2 xs)
  (if (empty? xs)
      empty
      (my-encode-aux 1 (first xs) (rest xs))))

(provide my-encode2)
