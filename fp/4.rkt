#lang racket
(require racket/trace)

;4 lab
(define (my-append list1 list2)
  (if (empty? list1)
      list2
      (cons (first list1) (my-append (rest list1) list2))))

(trace my-append)
(my-append '(a b c) '(a b))

(define (my-append2 . lists)
  (if (empty? lists)
      null
      (foldr my-append '() lists)))

(trace my-append2)
(my-append2 '(a b c) '(d e) '(a b))