#lang racket

(define (lookup env var)
  ;; var is a quoted atom
  (match env
    ['() #f]
    [(cons h _) #:when (equal? h var) #t]
    [(cons _ t) (lookup t var)]))

(define (eval exp env)
  (match exp
    [(list a 'and  b) (and (eval a env) (eval b env))]
    [(list a 'or   b) (or (eval a env) (eval b env))]
    [(list a 'nand b) (not (and (eval a env) (eval b env)))]
    [(list a 'nor  b) (not (or (eval a env) (eval b env)))]
    [(list a 'xor  b) (xor (eval a env) (eval b env))]
    [(list a 'imp  b) (or (not (eval a env)) (and (eval a env) (eval b env)))]
    [(list a 'eq   b) (eq? (eval a env) (eval b env))]
    [(list 'not    a) (not (eval a env))]
    [(list a)         (eval a env)]
    [var              (lookup env var)]))

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
