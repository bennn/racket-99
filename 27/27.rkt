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
  (foldl (lambda (y acc) (cons (cons x y) acc)) empty xs))

;; (define (group-by-size xs size)
;;   ; divide list into groups of size 'size'

;; (define (group xs sizes)
;;   ; divide list into groups. One new list for each element of 'sizes'
;;   ; pick one group from each of groups.
;; )

;; (define (group3 xs) (group xs (list 2 3 4)))

(provide pairwith
         ;; group
         ;; group3
         )
