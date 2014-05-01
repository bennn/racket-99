#lang racket

(require rackunit
         "37.rkt")

(check-equal? (my-phi 1) 1)
(check-equal? (my-phi 11) 10)
(check-equal? (my-phi 13) 12)
(check-equal? (my-phi 4) 2)
(check-equal? (my-phi 91) 72)
(check-equal? (my-phi 17) 16)
(check-equal? (my-phi 432) 144)
(check-equal? (my-phi 83) 82)
(check-equal? (my-phi 997) 996)
(check-equal? (my-phi 9001) 9000)
