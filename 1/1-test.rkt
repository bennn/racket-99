;; #lang racket
(require rackunit
         "1.rkt")

(check-equal? empty (my-last empty))
(check-equal? (list 1) (my-last (list 1)))
(check-equal? (list 1) (my-last (list 2 1)))
(check-equal? (list 4) (my-last (list 2 1 3 2 1 0 4)))
(check-equal? (list 99) (my-last (cons (list 1 1 1) (list 2 1 99))))

