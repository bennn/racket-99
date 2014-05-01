#lang racket

(require rackunit
         "27.rkt")

(check-equal? (pairwith 1 '()) '())
(check-equal? (pairwith 1 (list 1 2 3)) (list (list 1 1) (list 1 2) (list 1 3)))
(check-equal? (pairwith 9 (list 4 1 1 2 3)) (list (list 9 4) (list 9 1) (list 9 1) (list 9 2) (list 9 3)))

(check-equal? (groupwith 1 '()) '())
(check-equal? (groupwith 1 (list (list 1) (list 2) (list 3))) (list (list 1 1) (list 1 2) (list 1 3)))
(check-equal? (groupwith 9 (list (list 4 1) (list 1 2) (list 3))) (list (list 9 4 1) (list 9 1 2) (list 9 3)))

(check-equal? (groups-of-two empty) empty)
(check-equal? (groups-of-two (list 1)) empty)
(check-equal? (groups-of-two (list 19 99)) (list (list 19 99)))
(check-equal? (groups-of-two (list 1 2 3)) (list (list 1 2) (list 1 3) (list 2 3)))

(check-equal? (groups-of-three empty) empty)
(check-equal? (groups-of-three (list 1)) empty)
(check-equal? (groups-of-three (list 19 99)) empty)
(check-equal? (groups-of-three (list 1 2 3)) (list (list 1 2 3)))
(check-equal? (groups-of-three (list 1 2 3 4)) (list (list 1 2 3) (list 1 2 4) (list 2 3 4)))
