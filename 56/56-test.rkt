#lang racket

(require rackunit
         "56.rkt")

(check-equal? (is-symmetric empty) #t)
(check-equal? (is-symmetric (list "A" empty empty)) #t)
(check-equal? (is-symmetric (list "A" (list "B" (list "C" empty empty) empty) (list "B" (list "C" empty empty) empty))) #t)
(check-equal? (is-symmetric (list "A" (list "B" (list "C" empty (list "D" (list "E" empty empty) empty)) empty)
                                  (list "B" (list "C" empty (list "D" (list "E" empty empty) empty)) empty))) #t)

(check-equal? (is-symmetric (list "A" (list "B" empty empty) empty)) #f)
(check-equal? (is-symmetric (list "A" (list "B" empty (list "C" empty empty)) empty)) #f)
(check-equal? (is-symmetric (list "A" (list "B" (list "C" empty (list "D" (list "E" empty (list "F" empty empty)) (list "G" empty empty))) empty) empty)) #f)
