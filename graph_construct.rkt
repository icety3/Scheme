; -Public Function
(define (square x) (* x x))

; -DEF point
;  -CONS : make-point
;  -MEMB : x-is & y-is
(define (make-point x y)
  (cons x y))
(define (x-is p)
  (car p))
(define (y-is p)
  (cdr p))
; -DEF line
;  -CONS : make-line
;  -MEMB : s-is & t-is
(define (make-line s t)
  (cons s t))
(define (s-is l)
  (car l))
(define (t-is l)
  (cdr l))
; -FUNC -line
(define (line-s&t-iter op x?y object)
  (op (x?y (s-is object))
      (x?y (t-is object))))
(define (mid-point l)
  (make-point
   (/ (line-s&t-iter + x-is l) 2)
   (/ (line-s&t-iter + y-is l) 2)))
(define (k-of-line l)
  (/ (line-s&t-iter - y-is l)
     (line-s&t-iter - x-is l)))
(define (length-line l)
  (sqrt
   (+ (square (line-s&t-iter - x-is l))
      (square (line-s&t-iter - y-is l)))))
; -DEF rect
;  -CONS : make-rect
;  -MEMB : width-is height-is
(define (make-rect w h)
  (cons w h))
(define (width-is r)
  (car r))
(define (height-is r)
  (cdr r))
; -FUNC -rect
(define (calc-area r)
  (* (length-line (width-is r))
     (length-line (height-is r))))
(define (calc-circum r)
  (* (+ (length-line (width-is r))
        (length-line (height-is r))) 2))
; -DEF triangle
;  -CONS : make-triangle
;  -MEMB : triangle-line-is triangle-point-is
(define (make-triangle l p)
  (cons l p))
(define (triangle-line-is t)
  (car t))
(define (triangle-point-is t)
  (cdr t))
; -FUNC -triangle
(define (calc-triangle-area t))