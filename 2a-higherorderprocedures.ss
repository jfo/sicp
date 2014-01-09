(define (square a)
  (* a a))


(define (sum-int a b)
  (if (> a b )
      0
      (+ a
         (sum-int (1+ a) b))))

; (display (sum-int 2 3))
; (display (sum-int 3 2))

(define (sum-sq a b)
  (if (> a b)
      0
      (+ (square a)
         (sum-sq (1+ a) b))))

; (display (sum-sq 2 3))
; (display (sum-sq 3 2))

; leibniz' formula
(define (pi-sum a b)
  (if (> a b)
      0
      (+ (/ 1 (* a (+ a 2)))
         (pi-sum (+ a 4) b))))

; (display (pi-sum 3 4))

; general knowledge of procedure:
;
; (define (<name> a b)
;   (if (> a b)
;       0
;       (<term> a)
;          (<name> <next> a) b))))

(define (sum term a next b)
  (if (> a b)
    0
    (+
      (term a)
      (sum term
        (next a)
        next
        b))))

(define (sum-int a b)
  (define (identity a) a)
  (sum identity a 1+ b))

(define (sum-sq a b)
  (sum square a 1+ b))

; (display (sum-sq 2 3))


; PART TWO

; (display (sqrt 64))
(newline)
(newline)

; HERON OF ALEXANDRIA'S SQUARE ROOT COMPUTER
(define (average x y)
  (/ (+ x y) 2))

(define (hsqrt x)
  (define tolerance 0.0001)
  (define (good-enuf? y)
    (< (abs (- (* y y) x)) tolerance))
  (define (improve y)
    (average (/ x y) y))
  (define (try y)
    (if (good-enuf? y)
      y
      (try (improve y))))
  (try 1))


(define (fixed-point f start)
  (define tolerance 0.0001)
  (define (close-enuf? u v)
    (< (abs (- u v)) tolerance))
  (define (iter old new)
    (if (close-enuf? old new)
      new
      (iter new (f new))))
  (iter start (f start)))


(define (fsqrt x)
  (fixed-point 
    (average-damp (lambda(y)(/ x y)))
    1))

(define average-damp
  (lambda(f)
    (lambda(x) (average (f(x) x)))))
; is equivalent to:
(define (average-damp f)
  (define (foo x)
    (average (f x) x))
  foo)


; Newton's method for finding the roots of the function f
; to find a y such that 
;   f(y) = 0
; start with some guess, y0
;   yn + 1 = yn - f(vn) / df/dy | y = yn
; yikes jesus.
;
; "wishful thinking.... fundamental to computer science- name a functiona nd figure out how it works later.

(define deriv 
  (lambda(f)
    (lambda(x)
      (/ (- (f (+ x dx))
            (f x))
         dx))))

(define (newton f guess)
  (define df (deriv f))
  (fixed-point
    (lambda(x) (- x (/ (f x)(df x))))
  guess))

(define (nsqrt x)
  (newton (lambda(y) (- x (square y)))
          1))

(display (nsqrt 4))

; jesus, calculus. unbound dx so far....
