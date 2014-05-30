#lang racket

(require "46.rkt"
         rackunit)

;and
(check-equal? (eval (list 'and/2 'A 'A) (list 'A)) #t)
(check-equal? (eval (list 'and/2 'A 'B) (list 'A 'B)) #t)
(check-equal? (eval (list 'and/2 'A 'A) '()) #f)
(check-equal? (eval (list 'and/2 'B 'A) '(list 'A)) #f)

;or
(check-equal? (eval (list 'or/2 'A 'A) '()) #f)
(check-equal? (eval (list 'or/2 'A 'A) (list 'A)) #t)
(check-equal? (eval (list 'or/2 'A 'B) (list 'A 'B)) #t)
(check-equal? (eval (list 'or/2 'C 'D) (list 'A 'B)) #f)

; and/or
(check-equal? (eval (list 'or/2 (list 'and/2 'A 'A) (list 'and/2 'A 'A)) (list 'A)) #t)
(check-equal? (eval (list 'or/2 (list 'and/2 'A 'A) (list 'and/2 'A 'B)) (list 'A)) #t)
(check-equal? (eval (list 'or/2 (list 'and/2 'A 'B) (list 'and/2 'A 'B)) (list 'A 'B)) #t)
(check-equal? (eval (list 'or/2 (list 'and/2 'B 'B) (list 'and/2 'A 'A)) (list 'B)) #t)

(check-equal? (eval (list 'and/2 (list 'or/2 (list 'and/2 'A 'A) (list 'and/2 'A 'A)) 'A) (list 'A)) #t)
(check-equal? (eval (list 'and/2 (list 'or/2 (list 'and/2 'B 'B) (list 'and/2 'B 'B)) 'A) (list 'B)) #f)

;nand
(check-equal? (eval (list 'nand/2 'A 'B) (list 'A 'B)) #f)
(check-equal? (eval (list 'nand/2 'A 'B) (list 'B)) #t)
(check-equal? (eval (list 'nand/2 'A 'B) (list 'A)) #t)
(check-equal? (eval (list 'nand/2 'A 'B) (list )) #t)

;nor
(check-equal? (eval (list 'nor/2 'A 'B) (list 'A 'B)) #f)
(check-equal? (eval (list 'nor/2 'A 'B) (list 'B)) #f)
(check-equal? (eval (list 'nor/2 'A 'B) (list 'A)) #f)
(check-equal? (eval (list 'nor/2 'A 'B) (list )) #t)

;xor
(check-equal? (eval (list 'xor/2 'A 'B) (list 'A 'B)) #f)
(check-equal? (eval (list 'xor/2 'A 'B) (list 'B)) #t)
(check-equal? (eval (list 'xor/2 'A 'B) (list 'A)) #t)
(check-equal? (eval (list 'xor/2 'A 'B) (list )) #f)

;imp
(check-equal? (eval (list 'imp/2 'A 'B) (list 'A 'B)) #t)
(check-equal? (eval (list 'imp/2 'A 'B) (list 'B)) #t)
(check-equal? (eval (list 'imp/2 'A 'B) (list 'A)) #f)
(check-equal? (eval (list 'imp/2 'A 'B) (list )) #t)

;eq
(check-equal? (eval (list 'eq/2 'A 'B) (list 'A 'B)) #t)
(check-equal? (eval (list 'eq/2 'A 'B) (list 'B)) #f)
(check-equal? (eval (list 'eq/2 'A 'B) (list 'A)) #f)
(check-equal? (eval (list 'eq/2 'A 'B) (list )) #t)

