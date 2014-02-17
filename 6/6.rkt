#lang racket
;; is-palindrome

(define (is-palindrome xs)
  (equal? xs (reverse xs)))

(provide is-palindrome)
