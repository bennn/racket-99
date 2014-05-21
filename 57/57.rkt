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
    [(cons h t) (list->bst_aux t (bst-insert t h))]))

(define (list->bst xs)
  (list->bst_aux xs empty))

(provide list->bst)
