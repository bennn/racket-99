#lang typed/racket

;; is tree, typed

(define-type (Tree a) (U Leaf (Node a)))
(struct: Leaf ())
(struct: (a) Node ([v : a] [left : Tree] [right : Tree]))

(: is-tree (All (A) ((Tree A) -> Boolean)))
(define (is-tree t)
  #t)

(provide is-tree)

(assert (is-tree (Leaf)))
;; (assert (is-tree (Node 1 (Leaf) (Leaf))))
;; (assert (is-tree (Node "A" Leaf (Node "B" Leaf Leaf))))
