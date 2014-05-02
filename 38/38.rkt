#lang racket

(require "../37/37.rkt"
         "../34/34.rkt")

(define (phi-compare n)
  (let ([t1 (current-process-milliseconds #f)]
        [r1 (my-totient n)]
        [t2 (current-process-milliseconds #f)]
        [r2 (my-phi n)]
        [t3 (current-process-milliseconds #f)])
    (printf "Slow function ran in ~a seconds,~nFast function ran in ~a seconds,~nThat's a difference of ~a seconds.~n"
            (- t2 t1)
            (- t3 t2)
            (- (- t2 t1) (- t3 t2)))))

(phi-compare 10090)
