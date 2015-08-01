(define put
  (lambda (l)
    (display (eval l))
    (newline)))

(define puts
  (lambda (l)
    (map put (reverse l))))
