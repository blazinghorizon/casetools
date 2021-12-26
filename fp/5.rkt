#lang racket
(require racket/trace)
;5 lab

(define (sets s)
  (if (null? s)
      (list null)
      (let ((rest (sets (cdr s))))
        (append rest (map (lambda (ss) (cons (car s) ss)) rest)))))

(trace sets)
(sets '(1 2 3))