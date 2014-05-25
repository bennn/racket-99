#lang typed/racket

;; is tree, typed

(define-type (Tree a) (U Leaf (Node a)))
(struct: Leaf ())
(struct: (a) Node ([v : a]));; [left: Tree a] [right: Tree a]))

;; (: is-tree (All (a) (-> (Tree a) (Tree a))))
;; (define (is-tree t)
;;   #t)

;; (provide is-tree)
