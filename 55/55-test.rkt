#lang racket

(require rackunit
         "55.rkt")

(check-equal? (cbal-tree -3) #f)
(check-equal? (cbal-tree 0) empty)
(check-equal? (cbal-tree 1) (list "x" empty empty))
(check-equal? (cbal-tree 2) (list "x" (list "x" empty empty) empty))
(check-equal? (cbal-tree 3) (list "x" (list "x" empty empty) (list "x" empty empty)))
(check-equal? (cbal-tree 4) (list "x" (list "x" empty empty) (list "x" (list "x" empty empty) empty)))
(check-equal? (cbal-tree 7) (list "x" (list "x" (list "x" empty empty) (list "x" empty empty)) (list "x" (list "x" empty empty) (list "x" empty empty))))
(check-equal? (cbal-tree 8) (list "x" (list "x" (list "x" empty empty) (list "x" empty empty)) (list "x" (list "x" empty empty) (list "x" (list "x" empty empty) empty))))

(check-equal? (cbal-tree-match -3) #f)
(check-equal? (cbal-tree-match 0) empty)
(check-equal? (cbal-tree-match 1) (list "x" empty empty))
(check-equal? (cbal-tree-match 2) (list "x" empty (list "x" empty empty)))
(check-equal? (cbal-tree-match 3) (list "x" (list "x" empty empty) (list "x" empty empty)))
(check-equal? (cbal-tree-match 4) (list "x" (list "x" empty empty) (list "x" (list "x" empty empty) empty)))
(check-equal? (cbal-tree-match 7) (list "x" (list "x" (list "x" empty empty) (list "x" empty empty)) (list "x" (list "x" empty empty) (list "x" empty empty))))
(check-equal? (cbal-tree-match 8) (list "x" (list "x" (list "x" empty empty) (list "x" empty empty)) (list "x" (list "x" empty empty) (list "x" (list "x" empty empty) empty))))
