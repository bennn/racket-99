#lang typed/racket

(struct: Nil ())
(struct: (A) Cons ([hd : A] [tl : (List A)]))
(define-type (List A) (U Nil (Cons A)))

(struct: None ())
(struct: (A) Some ([val : A]))
(define-type (Option A) (U None (Some A)))

(: find-last (All (A) ((List A) -> (Option A))))
(define (find-last xs)
  (match xs
    [(Nil) (None)]
    [(Cons x (Nil)) (Some x)]
    [(Cons _ t) (find-last t)]))

(assert (= 0 (match (find-last (Nil)) [(None) 0] [(Some x) 1])))
(assert (= 1 (match (find-last (Cons 2 (Cons 1 (Nil)))) [(None) 0] [(Some x) x])))
(assert (= 3 (match (find-last (Cons 2 (Cons 1 (Cons 3 (Nil))))) [(None) 0] [(Some x) x])))

(: kth (All (A) ((List A) Integer -> (Option A))))
(define (kth xs n)
  (match xs
    [(Nil) (None)]
    [(Cons h t) (if (< n 0)
                    (None)
                (if (= n 0)
                    (Some h)
                    (kth t (sub1 n))))]))

(assert (= 0 (match (kth (Nil) 0) [(None) 0] [(Some x) 1])))
(assert (= 0 (match (kth (Nil) 1) [(None) 0] [(Some x) 1])))
(assert (= 0 (match (kth (Nil) -2) [(None) 0] [(Some x) 1])))
(assert (= 2 (match (kth (Cons 2 (Cons 1 (Cons 3 (Nil)))) 0) [(None) 0] [(Some x) x])))
(assert (= 1 (match (kth (Cons 2 (Cons 1 (Cons 3 (Nil)))) 1) [(None) 0] [(Some x) x])))
(assert (= 3 (match (kth (Cons 2 (Cons 1 (Cons 3 (Nil)))) 2) [(None) 0] [(Some x) x])))
(assert (= 0 (match (kth (Cons 2 (Cons 1 (Cons 3 (Nil)))) 3) [(None) 0] [(Some x) x])))

(: length (All (A) ((List A) -> Integer)))
(define (length xs)
  (match xs
    [(Nil) 0]
    [(Cons h t) (+ 1 (length t))]))

(assert (= 0 (length (Nil))))
(assert (= 1 (length (Cons 9 (Nil)))))
(assert (= 4 (length (Cons 1 (Cons 2 (Cons 3 (Cons 4 (Nil))))))))

(: foldl (All (A B) ((A B -> A) A (List B) -> A)))
(define (foldl f acc xs)
  (match xs
    [(Nil) acc]
    [(Cons h t) (foldl f (f acc h) t)]))

(: eqlist (All (A) ((A A -> Boolean) (List A) (List A) -> Boolean)))
(define (eqlist p xs ys)
  (match xs
    [(Nil) (match ys [(Nil) #t] [(Cons a b) #f])]
    [(Cons x xs) (match ys [(Nil) #f] [(Cons y ys) (and (p x y) (eqlist p xs ys))])]))

(: reverse (All (A) ((List A) -> (List A))))
(define (reverse xs)
  (foldl (lambda: ([acc : (List A)] [x : A]) (Cons x acc)) (Nil) xs))
   
(assert (eqlist = (Cons 3 (Cons 2 (Cons 1 (Nil)))) (reverse (Cons 1 (Cons 2 (Cons 3 (Nil)))))))
(assert (eqlist = (Nil) (reverse (Nil))))

(: foldr (All (A B) ((A B -> B) (List A) B -> B)))
(define (foldr f xs acc)
  (match xs
    [(Nil) acc]
    [(Cons x xs) (f x (foldr f xs acc))]))

(assert (let ([xs (Cons 1 (Cons 2 (Cons 3 (Nil))))]) (eqlist = xs (foldr (lambda: ([x : Integer] [acc : (List Integer)]) (Cons x acc)) xs (Nil)))))

(: map (All (A B) ((A -> B) (List A) -> (List B))))
(define (map f xs)
  (foldr (lambda: ([x : A] [acc : (List B)]) (Cons (f x) acc)) xs (Nil)))

(assert (eqlist = (Cons 2 (Cons 3 (Cons 4 (Nil)))) (map (lambda: ([x : Integer]) (+ x 1)) (Cons 1 (Cons 2 (Cons 3 (Nil)))))))
