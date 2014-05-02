#lang racket

(require rackunit
         "41.rkt")

(check-equal? (goldbach-list -12 0) empty)
(check-equal? (goldbach-list -2 -1) empty)
(check-equal? (goldbach-list 0 0) empty)

(check-equal? (goldbach-list 9 20) (list (cons 10 (list 3 7))
                                         (cons 12 (list 5 7))
                                         (cons 14 (list 3 11))
                                         (cons 16 (list 3 13))
                                         (cons 18 (list 5 13))
                                         (cons 20 (list 3 17))))
(check-equal? (goldbach-list 1 2000 50) (list (cons 992 (list 73 919))
                                              (cons 1382 (list 61 1321))
                                              (cons 1856 (list 67 1789))
                                              (cons 1928 (list 61 1867))))
