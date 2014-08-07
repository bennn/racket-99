#lang racket

(require "48.rkt"
         rackunit)

(table/2 (list 'A 'B) "A eq B")
(table/2 (list 'A 'B 'C 'D 'E) "A eq B")

(table/2 (list 'A 'B) "(A imp B)")

(table/2 (list 'A 'B 'C) "D imp C")

(table/2 (list 'A 'D) "A and (A or (not B))")

