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

(: is-tag? (Symbol (Listof Exp) -> Boolean))
(define (is-tag? t e)
  (eq? t (car e)))

(: closure? ((Listof Exp) -> Boolean))
(define (closure? e)
  (is-tag? 'closure e))

(: delay? ((Listof Exp) -> Boolean))
(define (delay? e)
  (is-tag? 'delay e))

(: force? ((Listof Exp) -> Boolean))
(define (force? e)
  (is-tag? 'force e))

(: thunk? ((Listof Exp) -> Boolean))
(define (thunk? e)
  (is-tag? 'thunk e))

(: lambda? ((Listof Exp) -> Boolean))
(define (lambda? e)
  (is-tag? 'fun e))

(: single? ((Listof Exp) -> Boolean)) 
(define (single? e)
  (cond ((empty? e)       #f)
        ((empty? (cdr e)) #t)
        (else             #f)))

(: app? ((Listof Exp) -> Boolean))
(define (app? e)
  (cond ((empty? e)       #f)
        ((empty? (cdr e)) #f)
        (else             #t)))

; TODO make a 'thunk' type?
(: make-thunk (Exp -> (Pairof Symbol Exp)))
(define (make-thunk e)
  (cons 'thunk e))

(: force-thunk ((Listof Exp) -> Exp))
(define (force-thunk e)
  (if (thunk? e) (cdr e) #f)); (printf "Not a thunk, cannot force\n")))

; TODO value type?
;; (define (eval e env)
;;   ;eval takes an expression and an environment to a value
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

(: eval ((Listof Exp) Env -> Exp))
(define (eval e env)
  (if (empty? e)
      #t
      #f))
      

(: apply ((List Symbol (List Symbol Symbol (Listof Any)) Env) Exp -> Exp))
(define (apply f val)
  ; apply takes a function and an argument to a value
  (match f
    [(list 'closure e env) (match e
                             [(list 'fun var exp) (eval exp (cons (cons var val) env))]
                             [_ (printf "Badly formatted closure\n")])]
    [_ (printf "Not a closure, cannot apply\n")]))

(provide eval)
