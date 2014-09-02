#lang typed/racket
;; length

(: my-length ((Listof Any) -> Integer))
(define (my-length xs)
  (match xs
    ['() 0]
    [ xs (+ 1 (my-length (cdr xs)))]))

(provide my-length)

(assert (= (my-length '()) 0))
(assert (= (my-length (list 1 2 3 4)) 4))
