#lang racket
(require racket/trace)

;3 lab
(define (repeated f n)
    (define (iter res i)
      (if (> i n)
          res
          (iter (compose f res) (+ 1 i))))
    (iter identity 1))

((repeated sqr 2) 5)