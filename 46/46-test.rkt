#lang racket

(require "46.rkt"
         rackunit)

(check-equal? (not/1 #t) #f)
(check-equal? (not/1 #f) #t)

(check-equal? (and/2 #t #t) #t)
(check-equal? (and/2 #f #t) #f)
(check-equal? (and/2 #t #f) #f)
(check-equal? (and/2 #f #f) #f)

(check-equal? (or/2 #t #t) #t)
(check-equal? (or/2 #f #t) #t)
(check-equal? (or/2 #t #f) #t)
(check-equal? (or/2 #f #f) #f)

(check-equal? (nand/2 #t #t) #f)
(check-equal? (nand/2 #f #t) #t)
(check-equal? (nand/2 #t #f) #t)
(check-equal? (nand/2 #f #f) #t)

(check-equal? (nor/2 #t #t) #f)
(check-equal? (nor/2 #f #t) #f)
(check-equal? (nor/2 #t #f) #f)
(check-equal? (nor/2 #f #f) #t)

(check-equal? (xor/2 #t #t) #f)
(check-equal? (xor/2 #f #t) #t)
(check-equal? (xor/2 #t #f) #t)
(check-equal? (xor/2 #f #f) #f)

(check-equal? (impl/2 #t #t) #t)
(check-equal? (impl/2 #f #t) #t)
(check-equal? (impl/2 #t #f) #f)
(check-equal? (impl/2 #f #f) #t)

(check-equal? (eq/2 #t #t) #t)
(check-equal? (eq/2 #f #t) #f)
(check-equal? (eq/2 #t #f) #f)
(check-equal? (eq/2 #f #f) #t)
