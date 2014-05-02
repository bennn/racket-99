#lang racket

(require rackunit
         "40.rkt")

(check-equal? (goldbach -12) #f)
(check-equal? (goldbach -2) #f)
(check-equal? (goldbach 0) #f)
(check-equal? (goldbach 1) #f)
(check-equal? (goldbach 2) #f)
(check-equal? (goldbach 3) #f)

(check-equal? (goldbach 5) #f)
(check-equal? (goldbach 9) #f)
(check-equal? (goldbach 111) #f)
(check-equal? (goldbach 9001) #f)

(check-equal? (goldbach 28) (list 5 23))
(check-equal? (goldbach 8) (list 3 5))
(check-equal? (goldbach 20) (list 3 17))
(check-equal? (goldbach 42) (list 5 37))
(check-equal? (goldbach 998) (list 7 991))
(check-equal? (goldbach 4210) (list 53 4157))

