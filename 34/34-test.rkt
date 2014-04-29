#lang racket

(require rackunit
         "34.rkt")

(check-equal? (my-totient 1) 1)
(check-equal? (my-totient 11) 10)
(check-equal? (my-totient 13) 12)
(check-equal? (my-totient 4) 2)
(check-equal? (my-totient 91) 72)
(check-equal? (my-totient 17) 16)
(check-equal? (my-totient 432) 144)
(check-equal? (my-totient 83) 82)
(check-equal? (my-totient 997) 996)
(check-equal? (my-totient 9001) 9000)

(check-equal? (my-totient-range 1) 1)
(check-equal? (my-totient-range 11) 10)
(check-equal? (my-totient-range 13) 12)
(check-equal? (my-totient-range 4) 2)
(check-equal? (my-totient-range 91) 72)
(check-equal? (my-totient-range 17) 16)
(check-equal? (my-totient-range 432) 144)
(check-equal? (my-totient-range 83) 82)
(check-equal? (my-totient-range 997) 996)
(check-equal? (my-totient-range 9001) 9000)


