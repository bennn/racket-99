#lang racket

(require "../40/40.rkt")

(define (goldbach-list n m [lo 0])
  (filter (lambda (x) (and (cdr x) (< lo (car (cdr x)))))
          (map (lambda (x) (cons x (goldbach x))) (range n (add1 m)))))

(provide goldbach-list)
  
