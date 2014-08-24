#lang racket

(require "repl.rkt"
         rackunit)

(check-equal? 5 (eval 5 '()))

(check-equal? #f (eval #f '()))

(check-equal? 5 (eval (list (list 'fun 'x 'x) 5) '()))

(check-equal? 5 (eval (list (list 'fun 'x (list 'fun 'y 'y)) 4 5) '()))
