;tools
(define (square x) (* x x))
(define (accumulate op init sequence)
  (if (null? sequence)
      init
      (op (car sequence)
          (accumulate op init (cdr sequence)))))
(define (filter condition sequence)
  (cond ((null? sequence) '())
        ((condition (car sequence))
         (cons (car sequence) (filter condition (cdr sequence))))
        (else (filter condition (cdr sequence)))))
(define (enum-integer low hgh)
  (if (= low hgh)
      (list low)
      (cons low (enum-integer (+ low 1) hgh))))
(define (enum-tree t)
  (cond ((null? t) '())
        ((not (pair? (car t))) (cons (car t) (enum-tree (cdr t))))
        (else (append (enum-tree (car t))
                      (enum-tree (cdr t))))))
;define
(define (fib n)
  (define (iter num pre cur)
    (if (= num n)
        cur
        (iter (+ num 1) cur (+ pre cur))))
  (iter 1 0 1))
(define (even-fib n)
  (filter even?
          (accumulate cons '()
                      (map fib
                           (enum-integer 1 n)))))
(define (find-even s t)
  (filter even?
          (enum-integer s t)))
(define (sum-of-even-in-tree t)
  (accumulate + 0
              (filter even?
                      (enum-tree t))))
(define (list-fib-square n)
  (accumulate cons '()
              (map square
                   (map fib
                        (enum-integer 1 n)))))
(define (product-odd-sequence s)
  (accumulate * 1
              (filter odd?
                      (enum-tree s))))
(define (max-even-of-tree t)
  (accumulate max
              0
              (filter even?
                      (enum-tree t))))
;practice
(define (map- p sequence)
  (accumulate (lambda (x y)
                (cons (p x) y)) '() sequence))
(define (append- seq1 seq2)  ;这TM神了！思考accmulate的构造
  (accumulate cons seq2 seq1))
(define (length- sequence)
  (accumulate (lambda (x y)
                (+ 1 y)) 0 sequence))

;example
(define A (list 1 2 3))
(define B (list 4 5 6))