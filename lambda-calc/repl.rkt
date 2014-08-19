#lang racket
;; see http://matt.might.net/articles/implementing-a-programming-language/

;;; blehhhh error with lookups
;eval takes an expression and an environment to a value
(define (eval e env) (cond
  ((symbol? e)       (cadr (assq e env)))
  ((eq? (car e) 'λ)  (cons e env))
  (else              (apply (eval (car e) env) (eval (cadr e) env)))))

; apply takes a function and an argument to a value
(define (apply f x)
  (eval (cddr (car f)) (cons (list (cadr (car f)) x) (cdr f))))

; read and parse stdin, then evaluate:
(display (eval (read) '()))
(newline)
