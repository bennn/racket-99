#lang racket

(require rackunit
         "32.rkt")

(check-equal? (my-gcd-if 36 63) 9)
(check-equal? (my-gcd-if 1 1) 1)
(check-equal? (my-gcd-if 9135 5) 5)
(check-equal? (my-gcd-if 541 3321) 1)
(check-equal? (my-gcd-if 18 12) 6)
(check-equal? (my-gcd-if 99 17) 1)

(check-equal? (my-gcd-cond 36 63) 9)
(check-equal? (my-gcd-cond 1 1) 1)
(check-equal? (my-gcd-cond 9135 5) 5)
(check-equal? (my-gcd-cond 541 3321) 1)
(check-equal? (my-gcd-cond 18 12) 6)
(check-equal? (my-gcd-cond 99 17) 1)
