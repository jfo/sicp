(define (sos x y) 
  (+ (sq x) (sq y))
)

(define (sq x)
  (* x x)
)

(printf "jfad")

(sos 3 4)

; kinds of expressions:

; numbers
; symbols 

; lambda expressions
; definitions
; conditionals
; combinations

(define (+ x y)
  (cond (= x 0)
    ;y
    (+ (-1+ x) (1+ y))))

; linear recursion is proportional to the input
; argument in both time and space:
; time = O(x)
; space = O(x) 

(define (fib n)
  (if (< n 2)
      n
      (+ (fib (- n 1))
         (fib (- n 2)))))

;tower of hanoi

(define (move n from to spare)
  (cond ((= n 0) "done")
        (else
          (move (-1+ n) from spare to)
          (print-move from to)
          (move (-1+ n) spare to from))))



