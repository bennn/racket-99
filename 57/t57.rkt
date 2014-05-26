#lang typed/racket

(struct: Leaf())
(struct: (A) Node ([val : A] [left : (Tree A)] [right : (Tree A)]))
(define-type (Tree A) (U Leaf (Node A)))

(: insert (All (A) (A (Tree A) -> (Tree A))))
(define (insert x t)
  (match t
    [(Leaf) (Node x t t)]
    [(Node h l r); (if (< x h) (insert x l)
                      (insert x r)]))

(: create-bst (All (A) ((Listof A) -> (Tree A))))
(define (create-bst l)
  (foldl (inst insert A) (Leaf) l))

