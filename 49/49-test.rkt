#lang racket

(require rackunit
         "49.rkt")

(check-equal? (gray-code 1) (list "0" "1"))
