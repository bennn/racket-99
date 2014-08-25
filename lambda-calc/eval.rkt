#lang racket
;; http://matt.might.net/articles/implementing-a-programming-language/

(define (lookup x env)
  ;; (printf "lookup ~a in environment ~a\n" x env)
  (match env
    ['() #f]
    [(cons (cons k v) t) (if (equal? x k) v (lookup x t))]))

(define (make-lambda e env)
  ;; (printf "make lambda with e=~a\n" e)
  (list 'closure e env))

(define (const? e)
  (or (boolean? e)
      (integer? e)))

(define (closure? e)
  (eq? (car e) 'closure))

(define (lambda? e)
  (eq? (car e) 'fun))

(define (app? e)
  (cond ((empty? e)       #f)
        ((empty? (cdr e)) #f)
        (else             #t)))

;eval takes an expression and an environment to a value
(define (eval e env)
  ;; (printf "eval ~a\n" e)
  (cond
   ; look up symbols
   ((symbol? e) (lookup e env))
   ; constants, closures already evaluated
   ((const? e)   e)
   ((closure? e) e)
   ; lambda becomes closure
   ((lambda? e)      (make-lambda e env))
   ; apply f to value, be aware of partial application
   ((app? e)    (let* ([f (eval (first e)  env)]
                       [v (eval (second e) env)]
                       [r (apply f v)])
                  (if (empty? (cddr e)) r (eval (cons r (cddr e)) env))))
   ; don't know. Assume it's a singleton list.
   (else        (eval (car e) env))))

; apply takes a function and an argument to a value
(define (apply f val)
  (match f
    [(list 'closure e env) (match e
                             [(list 'fun var exp) (eval exp (cons (cons var val) env))]
                             [_ (printf "Badly formatted closure\n")])]
    [_ (printf "Not a closure, cannot apply\n")]))

(provide eval)
