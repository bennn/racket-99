#lang racket

(require rackunit
         "36.rkt")

(check-equal? (my-prime-factors-mult -91) empty)
(check-equal? (my-prime-factors-mult 1) empty)
(check-equal? (my-prime-factors-mult 2) (list (cons 2 1)))
(check-equal? (my-prime-factors-mult 5) (list (cons 5 1)))
(check-equal? (my-prime-factors-mult 315) (list (cons 3 2) (cons 5 1) (cons 7 1)))
(check-equal? (my-prime-factors-mult 17) (list (cons 17 1)))
(check-equal? (my-prime-factors-mult 9) (list (cons 3 2)))
(check-equal? (my-prime-factors-mult 123) (list (cons 3 1) (cons 41 1)))
(check-equal? (my-prime-factors-mult 42) (list (cons 2 1) (cons 3 1) (cons 7 1)))
(check-equal? (my-prime-factors-mult 131) (list (cons 131 1)))
(check-equal? (my-prime-factors-mult 99) (list (cons 3 2) (cons 11 1)))
(check-equal? (my-prime-factors-mult 5412) (list (cons 2 2) (cons 3 1) (cons 11 1) (cons 41 1)))
(check-equal? (my-prime-factors-mult 64) (list (cons 2 6)))
