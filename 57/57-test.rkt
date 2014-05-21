#lang racket

(require rackunit
         "57.rkt"
         "../56/56.rkt")

(check-equal? (is-symmetric (list->bst (list 5 3 18 1 4 12 21))) #t)
(check-equal? (is-symmetric (list->bst (list 3 2 5 7 1))) #t)
        
