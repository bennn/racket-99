#lang racket

(define (rev-append xs ys)
  (if (empty? xs)
    ys
    (rev-append (cdr xs) (cons (car xs) ys))))

(define (my-rotate-aux xs ys i)
  (if (= i 0)
    (append xs (reverse ys))
    (if (empty? xs)
      (if (empty? ys)
        (my-rotate-aux ys empty (sub1 i))
        (my-rotate-aux ys empty i))
      (my-rotate-aux (cdr xs) (cons (car xs) ys) (sub1 i)))))

(define (my-rotate xs i)
  (if (< i 0)
    (my-rotate-aux xs empty (+ i (length xs)))
    (my-rotate-aux xs empty i)))

(provide my-rotate)
