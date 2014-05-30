#lang racket

(define (lookup env var)
  ;; var is a quoted atom
  (match env
    ['() #f]
    [(cons h _) #:when (equal? h var) #t]
    [(cons _ t) (lookup t var)]))

(define (imp a b)
  ;; a => b
  (match (cons a b)
    [(cons #t #t) #t]
    [(cons #t #f) #f]
    [(cons #f #t) #t]
    [(cons #f #f) #t]))

(define (eq a b)
  (match (cons a b)
    [(cons #t #t) #t]
    [(cons #t #f) #f]
    [(cons #f #t) #f]
    [(cons #f #f) #t]))

(define (eval exp env)
  (match exp
    [(list 'and/2 a b) (and (eval a env) (eval b env))]
    [(list 'or/2 a b) (or (eval a env) (eval b env))]
    [(list 'nand/2 a b) (not (and (eval a env) (eval b env)))]
    [(list 'nor/2 a b) (not (or (eval a env) (eval b env)))]
    [(list 'xor/2 a b) (xor (eval a env) (eval b env))]
    [(list 'imp/2 a b) (imp (eval a env) (eval b env))]
    [(list 'eq/2 a b) (eq (eval a env) (eval b env))]
    [var (lookup env var)]))

(define (table/2 exp varA varB)
  ;; evaluate [exp] with every combination of truth values for [varA] and [varB]
  (printf " ~a  ~a |  R\n" varA varB)
  (printf "----------\n")
  (for-each (lambda (env)
              (printf "~a ~a | ~a\n" (lookup env varA) (lookup env varB) (eval exp env))
              ) (list (list) (list varA) (list varB) (list varA varB))))

(provide eval
         table/2)
