#lang racket

(require "eval.rkt"
         rackunit)

(check-equal? (eval 5 '()) 5)

(check-equal? (eval #f '()) #f)

(check-equal? (eval (list (list 'fun 'x 'x) 5) '()) 5)

(check-equal? (eval (list (list 'fun 'x (list 'fun 'y 'y)) 4 5) '()) 5)

(check-equal? (eval (list 'force (list 'delay 42)) '()) 42)

(check-equal? (eval (list 'delay (list 'f 'f 'f)) '()) (cons 'thunk (list 'f 'f 'f)))
