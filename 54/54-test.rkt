#lang racket

(require rackunit
         "54.rkt")

(check-equal? (istree (list "A" (list "B" empty empty) empty)) #t)
(check-equal? (istree (list "A" (list "B" empty empty))) #f)
