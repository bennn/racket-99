#lang racket

(define (my-compress-aux prev xs)
  (if (empty? xs)
      empty
      (if (equal? prev (first xs))
          (my-compress-aux prev (rest xs))
          (cons (first xs) (my-compress-aux (first xs) (rest xs))))))

(define (my-compress xs)
  (if (empty? xs)
      xs
      (cons (first xs) (my-compress-aux (first xs) (rest xs)))))

(provide my-compress)
