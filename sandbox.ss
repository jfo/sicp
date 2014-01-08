(define (sq x) (* x x))
(define (sos x y) (+ (sq x) (sq y)))


(define (proc x y z)
  (cond ((and (> x y)(> y z)) (sos x y))
    ((and (> x z)(> z y)) (sos x z))
    ((and (> y z)(> z x)) (sos y z))
    ((and (> y x)(> x z)) (sos y x))
    ((and (> z x)(> x y)) (sos z x))
    ((and (> z y)(> y x)) (sos z y))))


; exercise 1.11 recursive

(define (f n)
  (cond ((< n 3) 
          n)
        ((> n 3)  
          (+ (f (- n 1))
             (* (f (- n 2)) 2)
             (* (f (- n 3)) 3)))
        ((= n 3)  
          (+ (f (- n 1))
             (* (f (- n 2)) 2)
             (* (f (- n 3)) 3)))))
