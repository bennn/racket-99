#lang typed/racket

;; is tree, typed

(define-type (Tree a) (U Leaf (Node a (Tree a) (Tree a))))
(struct: Leaf ())
(struct: (a) Node ([v : a] [left : Tree a] [right : Tree a]))

(: is-tree (All (A) ((Tree A) -> Boolean)))
(define (is-tree t)
  #t)

(provide is-tree)

;; (check-equal? (is-tree (Leaf '())) #t)
;; (check-equal? (is-tree (Node 1 Leaf Leaf)) #t)
;; (check-equal? (is-tree (Node "A" Leaf Leaf)) #t)
