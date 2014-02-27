#lang racket

(require rackunit
         "23.rkt")

;; Generate the random picks, make sure that each pick is a member of the input list
;; Also check that result is correct length
 (define (check-inv inlist i)
  (let ([result (my-rnd-select inlist i)])
    (check-equal? i (length result))
    (foldl (lambda (a x) (or a (list? (member x inlist)))) '#f result)))

(check-equal? (my-rnd-select empty 0) empty)
(check-equal? (my-rnd-select (list 1 2 3) 0) empty)
(check-false (check-inv (list 1 2 3 4 5) 0))
(check-true (< 0 (check-inv (list 1 2 3 4 5) 1)))
(check-true (< 0 (check-inv (list 1 2 3 4 5) 2)))
(check-true (< 0 (check-inv (list 1 2 3 4 5) 3)))
(check-true (< 0 (check-inv (list 1 2 3 4 5) 4)))
(check-true (< 0 (check-inv (list 1 2 3 4 5) 5)))
