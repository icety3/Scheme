(define (union-set . l) l)

(define (element-of-set? set var)
  (cond ((null? set) #f)
        ((equal? var (car set)) #t)
        (else (element-of-set? (cdr set) var))))

(define (adjoin-set set var)
  (if (element-of-set? set var)
      set
      (cons var set)))

(define (intersection-set a b)
  (cond ((or (null? a) (null? b)) '())
        ((element-of-set? a (car b))
         (cons (car b) (intersection-set a (cdr b))))
        (else (intersection-set a (cdr b)))))


(define A (union-set 1 2 3))
(define B (union-set 2 3 4))