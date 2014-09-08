(ns cljsicp.1a)

; three maing sections are:
; BLACK BOX ABSTRACTION
; CONVENTIONAL INTERFACES
; METALINGUISTIC ABSTRACTION

; to suppress detail, to go along
; and build bigger boxes.

; procedures are going to be our way to talk about
; imperative knowledge

; what are the primitive elements?
; what are the ways of putting them together?
; what are the means of abstraction?
;

; operator | operands
(apply       + '(3 4))
(+ 3 (* 4 8) 78)

; thinking about a lisp form as a tree!
; you traverse the tree and return values from the bottom up.
; parens act as a linear character string representation of a 2d
; structure.

(def a (* 5 5))

(def b (+ a
          (* a 5)))

(eval a)
(eval b)
(- a (/ b 5))

; syntactic sugar for defining a var to a fn
(defn square [x]
  (* x x))
(square 5)

(def squarelambda (fn[x]
                    (* x x)))
(squarelambda 5)

; throws error:
(square
  (square
    (square 1001)))

; doesn't:
(square
  (square
    (square 1001.0 )))

(type 1001)
(type 1001.0)
; so apparently doubles get huge like
; to bigints but longs dont? will have to look into it.
(type 100189898998098908978907878978978980.0)


; why the fuck isnt this built in? fucking fuck.

(defn myabs [x]
  (cond (< x 0) (- x)
        (>= x 0) x))
(defn average [x y]
  (/ (+ x y) 2))
(defn improve [guess x]
  (average guess (/ x guess)))
(defn good-enough? [guess x]
  (< (myabs (- (square guess) x))
     0.001))
(defn mytry [guess x]
  (if (good-enough? guess x)
    guess
    (mytry (improve guess x) x)))
(defn sqroot [x]
  (mytry 1 x))
(sqroot 9.0)
; awwww yessssss





