#lang racket

(require rackunit
         "61.rkt")

(check-equal? (count-leaves/2 empty) 0)
(check-equal? (count-leaves/2 (list "A" empty empty)) 1)
(check-equal? (count-leaves/2 (list "A"
                                    (list "B" empty empty)
                                    empty))
              1)
(check-equal? (count-leaves/2 (list "A"
                                    (list "B" (list "C" empty empty)
                                          empty)
                                    empty))
              1)
(check-equal? (count-leaves/2 (list "A" (list "B" empty empty)
                                    (list "C" empty empty)))
              2)
(check-equal? (count-leaves/2 (list "A" (list "B" (list "C" (list "D" empty empty) (list "E" empty empty))
                                              (list "F" empty (list "G" empty empty)))
                                    (list "H" (list "I" (list "J" empty (list "K" empty empty)) (list "L" empty (list "M" empty empty)))
                                          (list "N" empty (list "O" empty (list "P" empty empty))))))
              6)

(check-equal? (count-leaves-list empty) empty)
(check-equal? (count-leaves-list (list "A" empty empty)) (list "A"))
(check-equal? (count-leaves-list (list "A" (list "B" (list "C" (list "D" empty empty) (list "E" empty empty))(list "F" empty (list "G" empty empty)))(list "H" (list "I" (list "J" empty (list "K" empty empty)) (list "L" empty (list "M" empty empty)))(list "N" empty (list "O" empty (list "P" empty empty))))))
              (list "D" "E" "G" "K" "M" "P"))
