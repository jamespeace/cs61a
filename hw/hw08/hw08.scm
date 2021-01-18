(define (reverse lst)
  (cond ((null? lst) '())
    ((null? (cdr lst)) (list (car lst)))
    (else (append (reverse (cdr lst)) (list (car lst))))
  )
  ; (let (helper ((lambda (l result) 
  ;                 (if (null? l) '() (append )))))
  ;   ()
  ; )
)

(define (longest-increasing-subsequence lst)
  (cond
    ((null? lst) lst)
    (else (car (helper (create-subs lst) 0)))
  )
)

(define (helper lst prev)
  (cond ((null? lst) '())
    ((null? (cdr lst)) (list (car lst)))
    ((> prev (length (car lst))) (append (helper (cdr lst) prev) (list (car lst))))
    (else (append (list (car lst)) (helper (cdr lst) (length (car lst)))))
  )
)

(define (create-subs lst)
  (cond ((null? lst) '())
    (else (append (list (increasing-sub lst 0)) (create-subs (cdr lst))))
  )
)

(define (increasing-sub lst prev)
  (cond ((null? lst) '())
    ((> prev (car lst)) (increasing-sub (cdr lst) prev))
    (else (append (list (car lst)) (increasing-sub (cdr lst) (car lst))))
  )
)

(define (cadr s) (car (cdr s)))
(define (caddr s) (cadr (cdr s)))


; derive returns the derivative of EXPR with respect to VAR
(define (derive expr var)
  (cond ((number? expr) 0)
        ((variable? expr) (if (same-variable? expr var) 1 0))
        ((sum? expr) (derive-sum expr var))
        ((product? expr) (derive-product expr var))
        ((exp? expr) (derive-exp expr var))
        (else 'Error)))

; Variables are represented as symbols
(define (variable? x) (symbol? x))
(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

; Numbers are compared with =
(define (=number? expr num)
  (and (number? expr) (= expr num)))

; Sums are represented as lists that start with +.
(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list '+ a1 a2))))
(define (sum? x)
  (and (list? x) (eq? (car x) '+)))
(define (addend s) (cadr s))
(define (augend s) (caddr s))

; Products are represented as lists that start with *.
(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list '* m1 m2))))
(define (product? x)
  (and (list? x) (eq? (car x) '*)))
(define (multiplier p) (cadr p))
(define (multiplicand p) (caddr p))

(define (derive-sum expr var)
  (make-sum 
    (derive (addend expr) var)
    (derive (augend expr) var)))

(define (derive-product expr var)
  (let ((first (multiplier expr)) (second (multiplicand expr)))
    (make-sum 
      (make-product (derive first var) second)
      (make-product (derive second var) first))))

; Exponentiations are represented as lists that start with ^.
(define (make-exp base exponent)
  (cond ((eq? exponent 0) 1)
        ((eq? exponent 1) base)
        ((and (number? base) (number? exponent)) (expt base exponent))
        (else (list '^ base exponent)))
)

(define (base exp)
  (cadr exp)
)

(define (exponent exp)
  (caddr exp)
)

(define (exp? exp)
  (cond ((null? exp) #f)
    ((not (list? exp)) #f)
    ((null? (cdr exp)) #f)
    ((null? (caddr exp)) #f)
    (else (and (same-variable? (car exp) '^) (number? (caddr exp)))))
)

(define x^2 (make-exp 'x 2))
(define x^3 (make-exp 'x 3))

(define (derive-exp exp var)
  (let ((first (cadr exp)) (second (caddr exp)))
    (make-product second (make-exp first (- second 1))))
)