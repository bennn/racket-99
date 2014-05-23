#lang racket

(define (internals t)
  (match t
    ['() empty]
    [(list _ '() '()) empty]
    [(list x l r) (cons x (append (internals l) (internals r)))]))

(define (at-level t n)
  (match t
    ['() empty]
    [(list x '() '()) (if (= 1 n) (list x) empty)]
    [(list x l r) (if (= 1 n) (list x) (append (at-level l (- n 1)) (at-level r (- n 1))))]))

(provide internals
         at-level)
