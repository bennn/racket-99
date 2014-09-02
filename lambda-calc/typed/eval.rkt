#lang typed/racket

(define-type Exp Any)
(define-type Env (Listof (Pairof Symbol Exp)))
(define-type Const (U Boolean Integer))

(: lookup (Symbol Env -> Exp))
(define (lookup x env)
  ;; (printf "lookup ~a in environment ~a\n" x env)
  (match env
    ['() #f]
    [(cons (cons k v) t) (if (equal? x k) v (lookup x t))]))

(: make-lambda ((Listof Exp) Env -> (List Symbol Exp Env)))
(define (make-lambda e env)
  ;; (printf "make lambda with e=~a\n" e)
  (list 'closure e env))

(: const? (Exp -> Boolean : Const))
(define (const? e)
  (or (boolean? e)
      (exact-integer? e)))

;; (define (is-tag? t e)
;;   (eq? t (car e)))

;; (define (closure? e)
;;   (is-tag? 'closure e))

;; (define (delay? e)
;;   (is-tag? 'delay e))

;; (define (force? e)
;;   (is-tag? 'force e))

;; (define (thunk? e)
;;   (is-tag? 'thunk e))

;; (define (make-thunk e)
;;   (cons 'thunk e))

;; (define (force-thunk e)
;;   (if (thunk? e) (cdr e) (printf "Not a thunk, cannot force\n")))

;; (define (lambda? e)
;;   (is-tag? 'fun e))

;; (define (single? e)
;;   (cond ((empty? e)       #f)
;;         ((empty? (cdr e)) #t)
;;         (else             #f)))

;; (define (app? e)
;;   (cond ((empty? e)       #f)
;;         ((empty? (cdr e)) #f)
;;         (else             #t)))

;; ;eval takes an expression and an environment to a value
;; (define (eval e env)
;;   ;; (printf "eval ~a\n" e)
;;   (cond
;;    ; look up symbols
;;    ((symbol? e) (lookup e env))
;;    ; constants, closures already evaluated
;;    ((const? e)   e)
;;    ((closure? e) e)
;;    ((delay?   e) (make-thunk (second e)))
;;    ((force?   e) (eval (force-thunk (eval (second e) env)) env))
;;    ; lambda becomes closure
;;    ((lambda? e)       (make-lambda e env))
;;    ((single? e)  (eval (car e) env))
;;    ; apply f to value, be aware of partial application
;;    ((app? e)    (let* ([f (eval (first e)  env)]
;;                        [v (eval (second e) env)]
;;                        [r (apply f v)])
;;                   (if (empty? (cddr e)) r (eval (cons r (cddr e)) env))))
;;    ; don't know. Assume it's a singleton list.
;;    (else        (printf "Malformed expression ~a\n" e))))

;; ; apply takes a function and an argument to a value
;; (define (apply f val)
;;   (match f
;;     [(list 'closure e env) (match e
;;                              [(list 'fun var exp) (eval exp (cons (cons var val) env))]
;;                              [_ (printf "Badly formatted closure\n")])]
;;     [_ (printf "Not a closure, cannot apply\n")]))

;; (provide eval)
