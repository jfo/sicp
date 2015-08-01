(define squarelambda
  (lambda (x) (* x x)))

; (display (square 5))
; (display (squarelambda 5))

; (display
;   (square
;     (square
;       (square 1001))))


; (display (average 4.0 9.0))

; let's do herodotus's sqrt
;
; (define (square x)
  (* x x))

(define myabs
        (lambda (x)
        (cond ((< x 0) (- x))
              ((>= x 0) x))))

(define (average x y)
        (/ (+ x y) 2))

(define (improve guess x)
        (average guess (/ x guess)))

(define (good-enough? guess x)
        (< (myabs (- (square guess) x))
           .001))

(define (try guess x)
        (if (good-enough? guess x)
          guess
          (try (improve guess x) x)))

(define (sqroot x)
        (try 1 x))

; (display (sqroot 9.0))
; awwww yessssss
