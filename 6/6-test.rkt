#lang racket

(require rackunit
         "6.rkt")

(check-equal? #t (is-palindrome empty))
(check-equal? #t (is-palindrome (list 1)))
(check-equal? #f (is-palindrome (list 1 3)))
(check-equal? #t (is-palindrome (list 1 3 1)))
(check-equal? #f (is-palindrome (list 1 3 3 7)))
(check-equal? #t (is-palindrome (list (list 1 2 3) 3 3 (list 1 2 3))))
(check-equal? #t (is-palindrome (list #\a #\b #\l #\e #\w #\a #\s #\i #\e #\r #\e #\i #\s #\a #\w #\e #\l #\b #\a)))
(check-equal? #f (is-palindrome (list #\a #\b #\l #\e #\w #\a #\s #\i #\e #\s #\a #\w #\e #\l #\b #\a)))
