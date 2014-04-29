#lang typed/racket

(: my-gcd (Integer Integer -> Integer))
(define (my-gcd n m)
  (cond [(zero? n) m]
        [(zero? m) n]
        [(< n m) (my-gcd (- m n) n)]
        [else (my-gcd (- n m) m)]))

(assert (equal? (my-gcd 36 63) 9))
(assert (equal? (my-gcd 1 1) 1))
(assert (equal? (my-gcd 9135 5) 5))
(assert (equal? (my-gcd 541 3321) 1))
(assert (equal? (my-gcd 18 12) 6))
(assert (equal? (my-gcd 99 17) 1))
  
