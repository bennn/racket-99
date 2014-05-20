#lang racket

(define (is-mirror t1 t2)
  (match (cons t1 t2)
    [(cons empty empty) #t]
    [(cons (list _ l1 r1)
           (list _ l2 r2)) (and (is-mirror l1 r2)
                                (is-mirror l2 r1))]
    [_ #f]))

(define (is-symmetric t)
  (cond [(equal? t empty) #t]
        [else (is-mirror (second t) (third t))]))

(provide is-symmetric)
