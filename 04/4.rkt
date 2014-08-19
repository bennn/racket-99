#lang racket
;; length

;; FIRST SOLUTION
;; (define (my-length-aux i xs)
;;   (if (empty? xs)
;;       i
;;       (my-length-aux (add1 i) (rest xs))))
;; (define (my-length xs)
;;   (my-length-aux 0 xs))

;; MATCHING
(define (my-length xs)
  (match xs
    [(cons h t) (+ 1 (my-length t))]
    [empty 0]))

(provide my-length)
