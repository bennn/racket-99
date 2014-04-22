#lang racket

(define (sort-by-first pairs)
  ; sort a list of tuples using the first element as keys
  (sort pairs #:key car <))

(define (fst xs)
  (car xs))

(define (snd xs)
  (car (cdr xs)))

(define (trd xs)
  (car (cdr (cdr xs))))

(define (key-by-length xs)
  (list (length xs) xs))

(define (lsort xss)
  ; sort lists by length
  (map snd (sort-by-first (map key-by-length xss))))

(define (push-all freq stack out)
  ;; for each element of stack, add (list freq stack) to out
  (if (empty? stack) out (push-all freq (cdr stack) (cons (list freq (car stack)) out))))
  ;; (foldr (lambda (acc x) (cons (list freq x) acc)) out stack))

(define (get-freq-aux freq len stack xs ys)
  (if (empty? xs) (push-all freq stack ys)
      (let ([h (car xs)]
            [t (cdr xs)])
        (let (
            [len2 (car h)]
            [zs (cadr h)])
        (if (= len2 len)
            (get-freq-aux (add1 freq) len (cons zs stack) t ys)
            (get-freq-aux 1 len2 (list zs) t (push-all freq stack ys)))))))
  
(define (get-freq xss)
  (get-freq-aux 0 0 empty xss empty))
  ;; 2014-04-22 holy fuck, going recursive
  
  ;; input = list of (length list) pairs sorted by length, ascending
  ;; collect the sub-lists of each length, increment frequency throughout
  ;; push each (freq list) pair when a new length is found
  ;; (caddr (foldr (lambda (acc p) (let ([freq (car acc)]
  ;;                         [stack (cadr acc)]
  ;;                         [out (caddr acc)]
  ;;                         [freq2 (car p)]
  ;;                         [xs (cadr p)])
  ;;                         (if (= freq freq2)
  ;;                             (list (add1 freq) (cons xs stack) out)
  ;;                             (list 0 empty (push-all freq stack out)))))
  ;;        (list 0 empty empty) ;; acc is current-freq, sublist-stack, output
  ;;        xss)))

(define (lfsort xss)
  ; sort lists by length frequency
  ; first sort by length, then get frequency, then sort again
  (map snd 
  (sort-by-first (get-freq (sort-by-first (map key-by-length xss))))))

(provide sort-by-first
         snd
         key-by-length
         push-all
         lsort
         lfsort)
