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

(define (format-lines envs all-vars exp)
  ;; Evaluate the expression [exp]
  ;; with truth assigned positionally to variables in [all-vars]
  ;; determined by the binary representation of [n].
  (match envs
    ['() empty]
    [(cons env xs) (cons
                    (format "~a   ~a"
                            (map (lambda (v) (if (member v env) "#t " "#f ")) all-vars)
                            (eval exp env))
                    (format-lines xs all-vars exp))]))

(define (make-heading vars)
  ;; Make table header from list of variables
  (format "~a    R\n~a"
          (map (lambda (v) (format " ~a " (symbol->string v))) vars)
          (make-string (+ 10 (* 3 (length vars))) #\-)))

(define (powerset xs)
  (foldl (lambda (x acc)
           (foldl (lambda (y acc) (cons y (cons (cons x y) acc))) empty (reverse acc)))
         (list empty) (reverse xs)))

(define (table/2 vars str-exp)
  ;; evaluate [exp] with every combination of truth values for [varA] and [varB]
  ;; [exp] is a string like "and A B"
  (let ([exp (parse-str str-exp)])
    (begin
     (printf "Results for expression: ~a\n" str-exp)
     ;; Heading has ' V ' for each var V in [vars]
     (displayln (make-heading vars))
     (for-each displayln (format-lines (powerset vars) vars exp))
    )))

(provide eval
         table/2)
