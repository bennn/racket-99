#lang racket
; Find the last box in a list

(define (my-last-acc prev xs)
  (if (empty? xs)
      (list prev)
      (my-last-acc (first xs) (rest xs))))

(define (my-last xs)
  (if (empty? xs)
      empty
      (my-last-acc (first xs) (rest xs))))
  
(provide my-last)

;; SOLUTION
;; (defun my_last (lista)
;;   (if (null lista)
;;       nil
;;     (if (null (rest lista))
;; 	lista			 ; testa se a lista so tem um elemento
;;       (my_last (rest lista))		; recursao no resto da lista
;;       )
;;     )
;;   )
