#lang racket

(require
         rackunit/chk
         "1.rkt")

(chk
  [#:f (my-last empty)]
  (my-last (list 1)) 1
  (my-last (list 2 1)) 1
  (my-last (list 2 1 3 2 1 0 4)) 4
  (my-last (cons (list 1 1 1) (list 2 1 99))) 99
  (my-last '(2 1)) 1
  #:f (my-last '())
)

; (check-equal? #f (my-last empty))
; (check-equal? 1 (my-last (list 1)))
; (check-equal? 1 (my-last (list 2 1)))
; (check-equal? 4 (my-last (list 2 1 3 2 1 0 4)))
; (check-equal? 99 (my-last (cons (list 1 1 1) (list 2 1 99))))
; 
; (check-equal? 1 (my-last '(2 1)))
; (check-equal? #f (my-last '()))
