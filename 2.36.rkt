(define (accumulate-n op init advanced-seq)
  (if (null? (car advanced-seq))
      '()
      (cons (accumulate (lambda (x y)
                          (op (car x) y))
                        0
                        advanced-seq)
            (accumulate-n op
                          init
                          (map (lambda (x) (cdr x))
                               advanced-seq)))))
(define (accumulate op init sequence)
  (if (null? sequence)
      init
      (op (car sequence)
          (accumulate op init (cdr sequence)))))
             