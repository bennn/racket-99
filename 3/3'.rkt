#lang typed/racket

(: element-at (All (A) ((Listof A) Integer -> (Option A))))
(define (element-at xs i)
  (if (empty? xs) #f
      (if (= 0 i) (car xs) (element-at (cdr xs) (sub1 i)))))

(assert (equal? 1 (element-at (list 1) 0)))
(assert (equal? #f (element-at (list 1) 3)))
(assert (equal? 0 (element-at (list 1 4 5 0) 3)))
(assert (equal? 2 (element-at (list 1 2 0 10 21) 1)))
(assert (equal? #f (element-at '() 30)))
(assert (equal? #f (element-at '() 0)))

(: element-at-match (All (A) ((Listof A) Integer -> (Option A))))
(define (element-at-match xs i)
  (match (cons xs i)
    [(cons '() n) #f]
    [(cons (cons h t) n) (if (= 0 n) h (element-at-match t (sub1 i)))]))

(assert (equal? 1 (element-at-match (list 1) 0)))
(assert (equal? #f (element-at-match (list 1) 3)))
(assert (equal? 0 (element-at-match (list 1 4 5 0) 3)))
(assert (equal? 2 (element-at-match (list 1 2 0 10 21) 1)))
(assert (equal? #f (element-at-match '() 30)))
(assert (equal? #f (element-at-match '() 0)))
