#lang racket

(define (internals t)
  (match t
    ['() empty]
    [(list _ '() '()) empty]
    [(list x l r) (cons x (append (internals l) (internals r)))]))

(provide internals)
