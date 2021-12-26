#lang racket
(require racket/trace)

;2 lab
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))


(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))


(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner null-value term (next a) next b))))

(trace accumulate)


(define (accumulate-i combiner null-value term a next b)
  (define (acum-iter combiner term a next b res)
    (if (> a b)
        res
        (acum-iter combiner term (next a) next b
                   (combiner res (term a)))))

  (trace acum-iter)
  (acum-iter combiner term a next b null-value))


(sum identity 1 add1 5)
(product identity 1 add1 5)


(accumulate + 0 identity 1 add1 5)
(accumulate * 1 identity 1 add1 5)


(accumulate-i + 0 identity 1 add1 5)
(accumulate-i * 1 identity 1 add1 5)
