#lang racket

(require "eval.rkt")

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
