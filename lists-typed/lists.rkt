#lang typed/racket

(struct: Nil ())
(struct: (A) Cons ([hd : A] [tl : (List A)]))
(define-type (List A) (U Nil (Cons A)))

(struct: None ())
(struct: (A) Some ([val : A]))
(define-type (Option A) (U None (Some A)))

(: find-last (All (A) ((List A) -> (Option A))))
(define (find-last xs)
  (match xs
    [(Nil) (None)]
    [(Cons x (Nil)) (Some x)]
    [(Cons _ t) (find-last t)]))

(assert (= 1 (match (find-last (Cons 2 (Cons 1 (Nil)))) [(None) 0] [(Some x) x])))
