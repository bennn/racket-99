#lang racket

(require rackunit
         "33.rkt")

(check-equal? (coprime 1 1) #t)
(check-equal? (coprime 2 4) #f)
(check-equal? (coprime 12 43) #t)
(check-equal? (coprime 35 64) #t)
(check-equal? (coprime 120 70) #f)
