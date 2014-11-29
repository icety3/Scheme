(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coeff higher-terms)
                (+ this-coeff (* x higher-terms)))
              0
              coefficient-sequence))

(define (accumulate op init sequence)
  (cond ((null? sequence) init)
        (else (op (car sequence)
            (accumulate op init (cdr sequence))))))