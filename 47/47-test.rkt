#lang racket

(require "47.rkt"
         rackunit)

(table/2 'A 'B "A eq B")

(table/2 'A 'B "A imp B")

(table/2 'A 'B "(A imp B)")

(table/2 'A 'B "D imp C")

(table/2 'A 'B "A and (A or (not B))")
