#lang typed/racket

;; is tree, typed

(struct: Leaf ())
;; (struct: (A) Node ([left : Tree] [right : Tree]))
(struct: (A) Node ([val : A] [left : (Tree A)] [right : (Tree A)]))
(define-type (Tree A) (U Leaf (Node A)))

(: is-tree (All (A) ((Tree A) -> Boolean)))
(define (is-tree t)
  #t)

(provide is-tree)

(assert (is-tree (Leaf)))
(assert (is-tree (Node 1 (Leaf) (Leaf))))
(assert (is-tree (Node "A" (Leaf) (Node "B" (Leaf) (Leaf)))))
