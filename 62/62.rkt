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

(define (level-order-aux t n acc)
  ;; loop until call returns empty list
  (let ([r (at-level t n)])
    (if (empty? r)
        acc
        (level-order-aux t (add1 n) (foldl cons acc r)))))

(define (level-order t)
  (foldl cons empty (level-order-aux t 1 empty)))

(provide internals
         at-level
         level-order)
