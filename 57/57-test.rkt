#lang racket

(require rackunit
         "57.rkt"
         "../56/56.rkt"
         "../54/54.rkt")

;; tests from the problem description
(check-equal? (is-symmetric (list->bst (list 5 3 18 1 4 12 21))) #t)
(check-equal? (is-symmetric (list->bst (list 3 2 5 7 1))) #t)

(check-equal? (istree (list->bst (list 5 3 18 1 4 12 21))) #t)
(check-equal? (istree (list->bst (list 3 2 5 7 1))) #t)

(check-equal? (first (list->bst (list 5 3 18 1 4 12 21))) 5)
(check-equal? (second (list->bst (list 5 3 18 1 4 12 21))) (list 3 (list 1 empty empty) (list 4 empty empty)))
(check-equal? (third (list->bst (list 5 3 18 1 4 12 21))) (list 18 (list 12 empty empty) (list 21 empty empty)))

(check-equal? (first (list->bst (list 3 2 5 7 1))) 3)
(check-equal? (second (list->bst (list 3 2 5 7 1))) (list 2 (list 1 empty empty) empty))
(check-equal? (third (list->bst (list 3 2 5 7 1))) (list 5 empty (list 7 empty empty)))
