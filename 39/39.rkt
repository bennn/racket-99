#lang racket

(define (from n)
  ;; Stream of naturals starting at n
  (stream-cons n (from (add1 n))))

(define (sift s)
  (let ([hd (stream-first s)])
    (stream-cons hd (sift (stream-filter (lambda (x) (not (= 0 (modulo x hd)))) (stream-rest s))))))

(define gen-primes
  (sift (from 2)))

(define (primes-loop lo hi gen acc)
  (let ([next (stream-first gen)])
    (cond [(< next lo) (primes-loop lo hi (stream-rest gen) acc)]
          [(> next hi) acc]
          [else (primes-loop lo hi (stream-rest gen) (cons next acc))])))

(define (primes-in-range lo hi)
  ;; Enter a loop to collect all primes
  (reverse (primes-loop lo hi gen-primes empty)))

(provide primes-in-range)
