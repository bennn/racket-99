#lang typed/racket

(struct: None())
(struct: (A) Some ([val : A]))
(define-type (Option A) (U None (Some A)))

(struct: Leaf())
(struct: (A) Node ([val : A] [left : (Tree A)] [right : (Tree A)]))
(define-type (Tree A) (U Leaf (Node A)))
(struct: (A) BST ([compare : (A A -> Boolean)]
                  [tree : (Tree A)]))
(define-type (BinarySearchTree A) (BST A))

(: insert (All (A) (A (BinarySearchTree A) -> (BinarySearchTree A))))
(define (insert x bst)
  (match (BST-tree bst)
    [(Leaf) (BST (BST-compare bst) (Node x (Leaf) (Leaf)))]
    [(Node h l r) (let* ([cmp (BST-compare bst)])
                    (if (cmp x h)
                        (BST cmp (Node h (BST-tree (insert x (BST cmp l))) r))
                        (BST cmp (Node h l (BST-tree (insert x (BST cmp r)))))))]))

(: create-bst (All (A) ((A A -> Boolean) (Listof A) -> (BinarySearchTree A))))
(define (create-bst cmp l)
  (match l
    ['() (BST cmp (Leaf))]
    [(cons h t) (foldl (inst insert A) (BST cmp (Node h (Leaf) (Leaf))) t)]))

(: first-bst (All (A) ((BinarySearchTree A) -> (Option A))))
(define (first-bst bst)
  (match (BST-tree bst)
    [(Leaf) (None)]
    [(Node h _ _) (Some h)]))

(: count-nodes (All (A) ((BinarySearchTree A) -> Integer)))
(define (count-nodes bst)
  (match (BST-tree bst)
    [(Leaf) 0]
    [(Node _ l r) (+ 1
                     (count-nodes (BST (BST-compare bst) l))
                     (count-nodes (BST (BST-compare bst) r)))]))

(let ([tree (create-bst < (list 1 2 3 4 5 1 2 3))])
  (list
   (assert (match (first-bst tree) [(Some x) (= 1 x)] [(None) #f]))
   (assert (= 8 (count-nodes tree)))
   ))
