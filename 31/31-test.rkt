#lang racket

(require "31.rkt"
         rackunit)

(check-equal? (is-prime 1) #f)
(check-equal? (is-prime 2) #t)
(check-equal? (is-prime 3) #t)
(check-equal? (is-prime 4) #f)
(check-equal? (is-prime 5) #t)
(check-equal? (is-prime 6) #f)
(check-equal? (is-prime 7) #t)

(check-equal? (is-prime 17) #t)
(check-equal? (is-prime 255) #f)
(check-equal? (is-prime 1946) #f)
(check-equal? (is-prime 9001) #t)

(check-equal? (is-prime -1) #f)
(check-equal? (is-prime -9) #f)
(check-equal? (is-prime -1110) #f)

(check-equal? (is-prime 91) #f)
(check-equal? (is-prime 144) #f)
