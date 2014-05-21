#lang racket

(define (bst-insert t x)
  (match t
    ['() (list x empty empty)]
    [(list v l r) (if (< x v)
                      (list v (bst-insert l x) r)
                      (list v l (bst-insert r x)))]))

(define (list->bst_aux xs t)
  (match xs
    ['() t]
    [(cons a b) (list->bst_aux b (bst-insert t a))]))

(define (list->bst xs)
  (list->bst_aux xs empty))

(provide list->bst)
