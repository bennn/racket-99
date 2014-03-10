#lang racket

(require rackunit
         "32.rkt")

(check-equal? (my-gcd 36 63) 9)
