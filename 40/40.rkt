#lang racket

(define (stream-member n s)
  (cond [(equal? n (stream-first s)) #t]
        [(< n (stream-first s)) #f]
        [else (stream-member n (stream-rest s))]))

(define (from n)
  (stream-cons n (from (add1 n))))

(define (sift s)
  (let ([hd (stream-first s)]
        [tl (stream-rest s)])
  (stream-cons hd (sift (stream-filter (lambda (x) (not (= 0 (modulo x hd)))) tl)))))

(define gen-primes
  (sift (from 2)))

(define (is-prime n)
  (stream-member n gen-primes))

(define (goldbach-aux n gen)
  (let* ([hd (stream-first gen)]
         [m (- n hd)])
    (if (is-prime m)
        (if (< m hd) (list m hd) (list hd m)) ; Smallest in front
        (goldbach-aux n (stream-rest gen)))))

(define (goldbach n)
  ;; Find the two primes that sum up to n
  (cond [(< n 4) #f]
        [(not (= 0 (modulo n 2))) #f]
        [else (goldbach-aux n gen-primes)]))

(provide goldbach)
