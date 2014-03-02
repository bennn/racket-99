#lang racket

; (define (my-remove x xs)
;   (if (empty? xs)
;     empty
;     (if (equal? x (car xs))
;       (cdr xs)
;       (cons (car xs) (my-remove x (cdr xs))))))
;  
; (define (contains xs x)
;   (if (empty? xs)
;     '#f
;     (or (equal? x (car xs)) (contains (cdr xs) x))))
; 
; (define (my-combination k xs)
;   (if (= k 0)
;     (list empty)
;     (let ([yss (my-combination (sub1 k) xs)])
;       (foldl (lambda (acc x) (
;         foldl (lambda (acc ys) (append (cons x ys) acc))
;         acc yss))
;        empty xs))))
; I dunno how to specify signature
(define (my-powerset xs)
  (foldl (lambda (x acc)
    (foldl (lambda (ys bcc)
      ; cons (list (cons x ys) (ys)) bcc
      ; (cons (list x) (cons ys bcc))
      (append (list (cons x ys) ys) bcc)
    ) empty acc)
  ) (list empty) xs))

(define (my-combination k xs)
  (filter (lambda (xs) (= k (length xs))) (my-powerset xs)))

(provide my-combination)
