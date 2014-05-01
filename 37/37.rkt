#lang racket

(require "../34/34.rkt"
         "../36/36.rkt")

(define (my-phi-aux factors acc)
  (match factors
    ['() acc]
    [(cons (cons p m) t) (my-phi-aux t (+ acc (* (sub1 p) (expt p (sub1 m)))))]))

(define (my-phi n)
  (match (my-prime-factors-mult n)
    ['() (my-totient n)]
    [xs (my-phi-aux xs 0)]))
    ;; (foldl (lambda (x acc) (let ([p (first x)][m (second x)]) ((+ acc (* (sub1 p) (expt p (sub1 m)))))))
    ;;        0 (my-prime-factors-mult n)))

(provide my-phi)
