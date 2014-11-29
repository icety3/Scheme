#lang racket
( require ( planet "sicp.ss" ( "soegaard" "sicp.plt" 2 1)))

(define (like-wave4 p)
  (let ((p2 (beside p (flip-vert p))))
    (below p2 p2)))

(define (right-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (right-split painter (- n 1))))
        (beside painter (below smaller smaller)))))

(define (up-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (up-split painter (- n 1))))
        (below painter (beside smaller smaller)))))

(define (corner-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (corner-split painter (- n 1)))
            (up (up-split painter (- n 1)))
            (right (right-split painter (- n 1))))
           (beside (below painter up) (below right smaller)))))

(define (udlr painter n)
  (let ((pic (corner-split painter n)))
    (let ((pic2 (below (flip-vert pic) pic)))
      (let ((pic3 (beside (flip-horiz pic2) pic2)))
        pic3))))

(define (square-of-four tl tr bl br)
  (lambda (painter)
    (let ((top (beside (tl painter)
                       (tr painter)))
          (bottom (beside (bl painter)
                          (br painter))))
      (below bottom top))))


