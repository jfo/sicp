(load "utils.scm")
(load "1a.ss")

; 1.1
; meh

; 1.2
; lol
(/ (+ 5
      4
      (-
        2
        (-
          3
          (+
            6
            (/
              4
              5)))))
   (* 3
      (-
        6
        2)
      (-
        2
        7)))

; not so lol
(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5)))))
   (* 3 (- 6 2) (- 2 7)))

; 1.3
(define (sum-of-squares x y z)
  (+ (* x x) (* y y) (* z z)))

; 1.4
; huh, didn't even.
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

; 1.5
; scheme is applicative order eval'd, as opposed to normal order [lazy] eval.
; this function never returns a value because it keeps trying to expand (p)
; if it were normal order it would never try to expand the arg and return 0
; SCIENCE
(define (p) (p))
(define (test x y)
  (if (= x 0) 0 y))

; 1.6
; holy shit new if
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))
; new if is applicative order
; normal if only evaluates the winning branch
; if can be remade with a macro, but not a function definition

(define (change-maker amount denoms)
  (cond
    ((= amount 0) 1)
    ((< amount 0) 0)
    ((null? denoms) 0)
    (else
      (+ (change-maker (- amount (car denoms)) denoms)
         (change-maker amount (cdr denoms))))))
(change-maker 100 (reverse '(1 5 10 25 50)))

(put
  (sqrt-iter 7 9)
)
