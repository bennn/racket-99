#lang racket

;; type tree = (list x l r) | empty

(define (count-leaves/2 t)
  (match t
    ['() 1]
    [(list x l r) (+ (count-leaves/2 l) (count-leaves/2 r))]))

(provide count-leaves/2)
