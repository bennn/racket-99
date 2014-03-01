#lang racket

(require rackunit
         "25.rkt")

(define (check-inv xs)
  (let ([r (my-permute xs)])
    (check-equal? (length r) (length xs))
    (foldl (lambda (a x) (or a (list? (member x xs)))) '#f r)))

(check-equal? (my-permute empty) empty)
(check-equal? (my-permute (list 1)) (list 1))
(check-true (< 0 (check-inv (list 1 2 3 4 5))))
(check-true (< 0 (check-inv (list 12 6 2 75 1 0 87 9))))
