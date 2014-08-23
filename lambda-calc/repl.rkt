#lang racket
;; http://matt.might.net/articles/implementing-a-programming-language/

(define (lookup x env)
  ;; (printf "lookup ~a\n" x)
  (match env
    ['() #f]
    [(cons (cons k v) t) (if (equal? x k) v (lookup x t))]))

(define (make-lambda e env)
  ;; (printf "make lambda with e=~a\n" e)
  (cons env (list e)))

(define (const? e)
  (or (boolean? e)
      (integer? e)))

(define (closure? e)
  (and (= 2 (length e))
       (not (empty (cdr e)))))

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
   ((symbol? e) (lookup e env))
   ((const? e)   e)
   ((lambda? e)      (make-lambda e env))
   ; TODO don't forget the tail of e
   ((app? e)    (eval (cons (apply (eval (car e) env) (eval (cadr e) env)) (cddr e)) env))
   (else        (eval (car e) env))))
    ;; (let ([v ])
    ;;               (if (empty? (cddr e)) v (eval (cons v (cddr e)) env))))))



; apply takes a function and an argument to a value
(define (apply f x)
  (let* ([f-env  (car  f)]
         [lam    (cadr f)]
         [f-var  (cadr lam)]
         [f-body (caddr lam)])
    (eval f-body (cons (cons f-var x) f-env))))

(define (is_exit input)
  (or (eq? input 'exit)
      (eq? input 'quit)))

; read and parse stdin, then evaluate:
(define (repl env)
  (printf "> ")
  (let ([input (read)])
    (if (is_exit input) (printf "bye\n")
        (begin (displayln (eval input env)) (repl env)))))

(repl '())
