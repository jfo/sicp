(define (square a)
  (* a a))


(define (sum-int a b)
  (if (> a b )
      0
      (+ a
         (sum-int (1+ a) b))))

(display (sum-int 2 3))
(display (sum-int 3 2))

(define (sum-sq a b)
  (if (> a b)
      0
      (+ (square a)
         (sum-sq (1+ a) b))))

(display (sum-sq 2 3))
(display (sum-sq 3 2))
