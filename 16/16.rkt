#lang racket

(define (my-drop xs n) 
  (define (my-drop-aux xs i)
    (if (empty? xs)
      empty
      (if (= i 1)
        (my-drop-aux (cdr xs) n)
        (cons (first xs) (my-drop-aux (cdr xs) (sub1 i))))))
  (my-drop-aux xs n))

(provide my-drop)
  
