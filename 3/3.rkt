#lang racket
;; nth element

(define (element-at xs i)
  (if (empty? xs)
      empty
      (if (= 0 i)
          (first xs)
          (element-at (rest xs) (sub1 i)))))

(define (element-at-match xs i)
  (match xs
    ['() empty]
    [(cons h t) (if (= 0 i) h (element-at-match t (sub1 i)))]))

(define (element-at-fold xs i)
  ;; 2014-04-22 gah
  (cadr
   (foldl (lambda (acc x)
            (let ([j (car acc)])
              (if (= i j) (cons (add1 j) x) (cons (add1 j) (cdr acc)))))
          (cons i 0)
          xs)))

(provide element-at
         element-at-match
         element-at-fold)
