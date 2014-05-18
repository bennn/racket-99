#lang racket

(define (istree t)
  (cond [(empty? t) #t]
        ; need to check if list is too short
        [(empty? (cdr t)) #f]
        [(empty? (cddr t)) #f]
        [(empty? (cdddr t)) (and (istree (cadr t)) (istree (caddr t)))]
        [else #f]))

(define (istree-match t)
  (match t
    ['() #t]
    [(list _ l r) (and (istree-match l) (istree-match r))]
    [_ #f]))

(provide istree
         istree-match)
