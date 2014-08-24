#lang racket

(require "repl.rkt"
         rackunit)

(check-equal? (eval 5 '()) 5)

(check-equal? (eval #f '()) #f)

(check-equal? (eval (list (list 'fun 'x 'x) 5) '()) 5)

(check-equal? (eval (list (list 'fun 'x (list 'fun 'y 'y)) 4 5) '()) 5)
