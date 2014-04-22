#lang racket

(require rackunit
         "28.rkt")

(check-equal? (sort-by-first (list '(1 3) '(2 2) '(3 1))) (list '(1 3) '(2 2) '(3 1)))
(check-equal? (sort-by-first (list '(2 2) '(3 1) '(1 3))) (list '(1 3) '(2 2) '(3 1)))
(check-equal? (sort-by-first (list '(2 2) '(3 1) '(1 3) '(4 5))) (list '(1 3) '(2 2) '(3 1) '(4 5)))

(check-equal? (map snd (sort-by-first (list '(2 2) '(3 1) '(1 3) '(4 5)))) (list 3 2 1 5))

(check-equal? (map key-by-length (list '(2) '(3 1) '(1 3) '(1 4 5))) (list (list 1 '(2)) (list 2 '(3 1)) (list 2 '(1 3)) (list 3 '(1 4 5))))

(check-equal? (lsort (list '() '() (list 1) '())) (list '() '() '() (list 1)))
(check-equal? (lsort (list (list 1 2 3) (list 5 43) (list 432 111 1) (list 5 543) (list 0 9 8 0) (list 33 333 33) (list 1111))) (list (list 1111) (list 5 43) (list 5 543) (list 1 2 3) (list 432 111 1) (list 33 333 33)(list 0 9 8 0)))

(check-equal? (push-all 1 (list 2 3 4) empty) (list (list 1 4) (list 1 3) (list 1 2)))
(check-equal? (push-all 1 (list 2 3 4) (list (list 9 9) (list 8 90))) (list (list 1 4) (list 1 3) (list 1 2) (list 9 9) (list 8 90)))

(check-equal? (lfsort (list '() '() (list 1) '())) (list (list 1) '() '() '()))
(check-equal? (lfsort (list (list 999) (list 1) (list 1) '())) (list '() (list 999) (list 1) (list 1)))
(check-equal? (lfsort (list (list 1 2 3) (list 4 5) (list 6 7 8) (list 4 5) (list 9 10 11 12) (list 13 14) (list 15)))
              (list (list 9 10 11 12) (list 15) (list 1 2 3) (list 6 7 8) (list 4 5) (list 4 5) (list 13 14)))
