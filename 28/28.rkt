#lang racket

(define (sort-by-first pairs)
  ; sort a list of tuples using the first element as keys
  (sort pairs #:key car <))

(define (fst xs)
  (car xs))

(define (snd xs)
  (car (cdr xs)))

(define (trd xs)
  (car (cdr (cdr xs))))

(define (key-by-length xs)
  (list (length xs) xs))

(define (lsort xss)
  ; sort lists by length
  (map snd (sort-by-first (map key-by-length xss))))

(provide sort-by-first
         snd
         key-by-length
         lsort)
