#lang racket

(require racket/contract)

(define (nand/2 a b)
  (match (cons a b)
    [(cons #t #t) #f]
    [(cons #f #t) #t]
    [(cons #t #f) #t]
    [(cons #f #f) #t]))

(define (not/1 a)
  (nand/2 a a))

(define (and/2 a b)
  (not/1 (nand/2 a b)))

(define (or/2 a b)
  (nand/2 (not/1 a) (not/1 b)))

(define (nor/2 a b)
  (not/1 (or/2 a b)))

(define (xor/2 a b)
  (and/2 (or/2 a b) (nand/2 a b)))

(define (impl/2 a b)
  (not/1 (and/2 a (not/1 b))))

(define/contract (eq/2 a b)
  (boolean? boolean? . -> . boolean?)
  (equal? a b))

(provide not/1
         and/2
         or/2
         nand/2
         nor/2
         xor/2
         impl/2
         eq/2)
