#lang racket

;; type tree = (list x l r) | empty

(define (count-leaves/2 t)
  (match t
    ['() 0]
    [(list _ empty empty) 1]
    [(list _ l r) (+ (count-leaves/2 l) (count-leaves/2 r))]))

(define (count-leaves-list t)
  (match t
    ['() empty]
    [(list x '() '()) (list x)]
    [(list _ l r) (append (count-leaves-list l)
                          (count-leaves-list r))]))

(provide count-leaves/2
         count-leaves-list)
