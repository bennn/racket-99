#lang racket

(require "../23/23.rkt")

(define (my-permute xs)
  (my-rnd-select xs (length xs)))

(provide my-permute)
