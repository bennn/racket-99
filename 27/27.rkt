#lang racket

;;;; duuuude this problem is no fun.

;; a) In how many ways can a group of 9 people work in 3 disjoint subgroups of 2, 3 and 4 persons? Write a function that generates all the possibilities and returns them in a list.

;; Example:
;; * (group3 '(aldo beat carla david evi flip gary hugo ida))
;; ( ( (ALDO BEAT) (CARLA DAVID EVI) (FLIP GARY HUGO IDA) )
;; ... )

;; b) Generalize the above predicate in a way that we can specify a list of group sizes and the predicate will return a list of groups.

;; Example:
;; * (group '(aldo beat carla david evi flip gary hugo ida) '(2 2 5))
;; ( ( (ALDO BEAT) (CARLA DAVID) (EVI FLIP GARY HUGO IDA) )
;; ... )

;; Note that we do not want permutations of the group members; i.e. ((ALDO BEAT) ...) is the same solution as ((BEAT ALDO) ...). However, we make a difference between ((ALDO BEAT) (CARLA DAVID) ...) and ((CARLA DAVID) (ALDO BEAT) ...).

;; You may find more about this combinatorial problem in a good book on discrete mathematics under the term "multinomial coefficients".

(define (pairwith x xs)
  ;; Create pairs of (x,y) for each y in xs
  (reverse (foldl (lambda (y acc) (cons (list x y) acc)) empty xs)))

(define (groupwith x xs)
  ;; Similar to pairwith, but assumes elements of xs are lists themselves
  (reverse (foldl (lambda (ys acc) (cons (append (list x) ys) acc)) empty xs)))

(define (groups-of-two xs)
  ;; Get all groups of two from a list by pairing each head with the tail
  (match xs
    ['() empty]
    [(list x) empty]
    [(list x y) (list (list x y))]
    [(cons h t) (append (pairwith h t) (groups-of-two t))]))

(define (groups-of-three xs)
  (match xs
    ['() empty]
    [(list x) empty]
    [(list x y) empty]
    [(list x y z) (list (list x y z))]
    [(cons h1 (cons h2 t)) (append (groupwith h1 (pairwith h2 t)) (groups-of-three (cons h2 t)))]))

;; (define (group3 xs)
;;   (let ([of-two 

;; (define (group-by-size xs size)
;;   ; divide list into groups of size 'size'

;; (define (group xs sizes)
;;   ; divide list into groups. One new list for each element of 'sizes'
;;   ; pick one group from each of groups.
;; )

;; (define (group3 xs) (group xs (list 2 3 4)))

(provide pairwith
         groupwith
         groups-of-two
         groups-of-three
         ;; group
         ;; group3
         )
