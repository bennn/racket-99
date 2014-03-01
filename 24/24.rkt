#lang racket

(require "../23/23.rkt"
         "../22/22.rkt")

(define (my-lotto i j)
  (my-rnd-select (my-range 0 j) i))

(provide my-lotto)
