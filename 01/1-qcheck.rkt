#lang racket

(require "1.rkt"
         quickcheck)

(define (nonempty-list-prop elem pred)
  (property ([xs (arbitrary-list elem)])
            (if (empty? xs) #t (pred xs))))

;; (quickcheck my-last-returns-hd-rev-integer)
;; (quickcheck my-last-returns-hd-rev-string)
;; (quickcheck my-last-returns-hd-rev-list-int)
(quickcheck (nonempty-list-prop arbitrary-integer (lambda (xs) (equal? (my-last xs) (car (reverse xs))))))
