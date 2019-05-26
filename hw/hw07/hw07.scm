(define (cddr s)
  (cdr (cdr s)))

(define (cadr s)
  (car (cdr s))
)

(define (caddr s)
  (car (cddr s))
)

(define (sign x)
  (cond 
  ((> x 0) 1)
  ((< x 0) -1)
  (else 0))
)

(define (square x) (* x x))

(define (pow b n)
  (cond ((= n 0) 1)
    ((= n 1) b)
    ((even? n) (pow (square b) (/ n 2)))
    (else (* (pow b (- n 1)) b))
  )
)

(define (ordered? s)
  (cond 
    ((null? s) True)
    ((null? (cdr s)) True)
    ((> (car s) (cadr s)) False)
    (else (ordered? (cdr s)))
  )
)