#lang racket

(define (my-pack-aux prev xs)
  (if (empty? xs)
      (list prev)
      (if (equal? (first prev) (first xs))
          ; Add to accumulator
          (my-pack-aux (cons (first prev) prev) (rest xs))
          ; Start new accumulator
          (cons prev (my-pack-aux (list (first xs)) (rest xs))))))

(define (my-pack xs)
  (if (empty? xs)
      xs
      (my-pack-aux (list (first xs)) (rest xs))))

(provide my-pack)
