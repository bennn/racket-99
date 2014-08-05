#lang racket

(require "1.rkt"
         quickcheck)

(define my-last-returns-hd-rev-int
  (property ([xs (arbitrary-list arbitrary-integer)])
            (= (my-last xs) (if (empty? xs) 0 (car (reverse xs))))))

(quickcheck my-last-returns-hd-rev-int)
