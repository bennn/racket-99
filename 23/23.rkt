#lang racket

(require "../19/19.rkt")

(define (my-rnd-select xs i)
  (if (< i 1)
    empty
    (let ([len (length xs)])
      (let ([r (random len)])
        ;; draw random number, rotate list so that element's at head, pull
        (let ([rotated (my-rotate xs (- len r))])
          (cons (car rotated) (my-rnd-select (cdr rotated) (sub1 i))))))))
       
(provide my-rnd-select)
