#lang racket

(require "39.rkt"
         rackunit)

(check-equal? (primes-in-range 1 1) empty)
(check-equal? (primes-in-range 99 100) empty)
(check-equal? (primes-in-range 1 10) (list 2 3 5 7))
(check-equal? (primes-in-range 30 40) (list 31 37))
(check-equal? (primes-in-range 101 151) (list 101 103 107 109 113 127 131 137 139 149 151))
