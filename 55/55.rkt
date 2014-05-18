#lang racket

(define (cbal-tree n)
  (cond [(< n 0) #f]
        [(= 0 n) empty]
        [(= 1 n) (list "x" empty empty)]
        [(= 2 n) (list "x" (list "x" empty empty) empty)]
        [(= 0 (modulo n 2)) (list "x" (cbal-tree (- (/ n 2) 1)) (cbal-tree (/ n 2)))]
        [else (list "x" (cbal-tree (/ (- n 1) 2)) (cbal-tree (/ (- n 1) 2)))]))

(define (cbal-tree-match n)
  (match n
    [0 empty]
    [1 (list "x" empty empty)]
    [n #:when (< n 0) #f]
    [n #:when (= 0 (modulo n 2)) (list "x" (cbal-tree (- (/ n 2) 1)) (cbal-tree (/ n 2)))]
    [n (list "x" (cbal-tree (/ (- n 1) 2)) (cbal-tree (/ (- n 1) 2)))]))

(provide cbal-tree
         cbal-tree-match)
