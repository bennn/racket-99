#lang racket
;; reverse a list

;; SOLUTION 1
;; (define (my-rev-aux xs ys)
;;   (if (empty? xs)
;;       ys
;;       (my-rev-aux (rest xs) (cons (first xs) ys))))

;; SOLUTION 2
;; (define (my-rev-aux xs ys)
;;   (match xs
;;     [(cons h t) (my-rev-aux t (cons h ys))]
;;     [empty ys]))

;; (define (my-rev xs)
;;   (my-rev-aux xs empty))

;; SOLUTION 3
(define (my-rev xs)
  (reverse xs))

(provide my-rev)
      
