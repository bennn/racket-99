#lang racket

(require rackunit
         "62.rkt")

(check-equal? (internals empty) empty)
(check-equal? (internals (list "A" empty empty)) empty)
(check-equal? (internals (list "A" (list "B" empty empty) empty)) (list "A"))
(check-equal? (internals (list "A" (list "B" empty (list "C" empty empty)) (list "D" empty (list "E" empty empty)))) (list "A" "B" "D"))
(check-equal? (internals (list "A" (list "B" (list "C" (list "D" empty empty) (list "E" empty empty))(list "F" empty (list "G" empty empty)))(list "H" (list "I" (list "J" empty (list "K" empty empty)) (list "L" empty (list "M" empty empty)))(list "N" empty (list "O" empty (list "P" empty empty))))))
              (list "A" "B" "C" "F" "H" "I" "J" "L" "N" "O"))

(check-equal? (at-level empty 0) empty)
(check-equal? (at-level empty 1) empty)
(check-equal? (at-level empty -3) empty)
(check-equal? (at-level (list "A" empty empty) 0) empty)
(check-equal? (at-level (list "A" empty empty) 1) (list "A"))
(check-equal? (at-level (list "A" (list "B" empty (list "C" empty empty)) (list "D" empty empty)) 1) (list "A"))
(check-equal? (at-level (list "A" (list "B" empty (list "C" empty empty)) (list "D" empty empty)) 2) (list "B" "D"))
(check-equal? (at-level (list "A" (list "B" empty (list "C" empty empty)) (list "D" empty empty)) 3) (list "C"))
(check-equal? (at-level (list "A" (list "B" empty (list "C" empty empty)) (list "D" empty (list "E" empty empty))) 1) (list "A"))
(check-equal? (at-level (list "A" (list "B" empty (list "C" empty empty)) (list "D" empty (list "E" empty empty))) 2) (list "B" "D"))
(check-equal? (at-level (list "A" (list "B" empty (list "C" empty empty)) (list "D" empty (list "E" empty empty))) 3) (list "C" "E"))
(check-equal? (at-level (list "A" (list "B" empty (list "C" empty empty)) (list "D" empty (list "E" empty empty))) 4) empty)
(check-equal? (at-level (list "A" (list "B" (list "C" (list "D" empty empty) (list "E" empty empty))(list "F" empty (list "G" empty empty)))(list "H" (list "I" (list "J" empty (list "K" empty empty)) (list "L" empty (list "M" empty empty)))(list "N" empty (list "O" empty (list "P" empty empty)))))
                        5)
              (list "K" "M" "P"))
