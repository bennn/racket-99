#lang racket

(require rackunit
         "54.rkt")

(check-equal? (istree empty) #t)
(check-equal? (istree (list "A" empty empty)) #t)
(check-equal? (istree (list "A" (list "B" empty empty) empty)) #t)
(check-equal? (istree (list "A" (list "B" empty (list "C" empty empty)) empty)) #t)
(check-equal? (istree (list "A" (list "B" (list "C" empty (list "D" (list "E" empty (list "F" empty empty)) (list "G" empty empty))) empty) empty)) #t)
                            

(check-equal? (istree (list empty empty)) #f)
(check-equal? (istree (list "A" (list "B" empty empty))) #f)
(check-equal? (istree (list "A" (list "B" empty empty) (list "C" empty (list "D")))) #f)
(check-equal? (istree (list "A" (list "B" (list "C" (list "D" (list "E" empty (list "F" empty empty)) (list "G" empty empty))) empty) empty)) #f)
