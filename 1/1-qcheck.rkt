#lang racket

(require "1.rkt"
         quickcheck)

(define my-last-returns-hd-rev-integer
  (property ([xs (arbitrary-list arbitrary-string)])
            (if (empty? xs) true (equal? (my-last xs) (car (reverse xs))))))

(define my-last-returns-hd-rev-string
  (property ([xs (arbitrary-list arbitrary-integer)])
            (if (empty? xs) true (equal? (my-last xs) (car (reverse xs))))))

(quickcheck my-last-returns-hd-rev-integer)
(quickcheck my-last-returns-hd-rev-string)
