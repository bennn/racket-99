#lang racket

(define (lookup env var)
  ;; var is a quoted atom
  (match env
    ['() #f]
    [(cons h _) #:when (equal? h var) #t]
    [(cons _ t) (lookup t var)]))

(define (eval exp env)
  (match exp
    [(list 'and/2 a b)  (and (eval a env) (eval b env))]
    [(list 'or/2 a b)   (or (eval a env) (eval b env))]
    [(list 'nand/2 a b) (not (and (eval a env) (eval b env)))]
    [(list 'nor/2 a b)  (not (or (eval a env) (eval b env)))]
    [(list 'xor/2 a b)  (xor (eval a env) (eval b env))]
    [(list 'imp/2 a b)  (or (not (eval a env)) (and (eval a env) (eval b env)))]
    [(list 'eq/2 a b)   (eq? (eval a env) (eval b env))]
    [var                (lookup env var)]))

(define (parse-until-eof inp)
  (match (read inp)
    [x #:when (eof-object? x) empty]
    [x                        (cons x (parse-until-eof inp))]))

(define (parse-str str)
  ;; read whole string into a list
  (parse-until-eof (open-input-string str)))

(define (table/2 varA varB str-exp)
  ;; evaluate [exp] with every combination of truth values for [varA] and [varB]
  ;; [exp] is a string like "and A B"
  (let ([exp (parse-str str-exp)])
    (begin
     (printf "Results for expression: ~a\n" str-exp)
     (printf " ~a  ~a |  R\n" varA varB)
     (printf "----------\n")
     (printf "#t #t | ~a\n" (eval exp (list varA varB)))
     (printf "#t #f | ~a\n" (eval exp (list varA)))
     (printf "#f #t | ~a\n" (eval exp (list varB)))
     (printf "#f #f | ~a\n\n" (eval exp empty))
    )))

(provide eval
         table/2)
