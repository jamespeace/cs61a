;; Scheme ;;

(define (over-or-under x y)
    (if (> x y)
        1
        (if (< x y)
            -1
            0
        )
    )
)

;;; Tests
(over-or-under 1 2)
; expect -1
(over-or-under 2 1)
; expect 1
(over-or-under 1 1)
; expect 0

(define (filter-lst f lst)
    (if (null? lst)
        nil
        (if (f(car lst))
            (cons (car lst) (filter-lst f (cdr lst)))
            (filter-lst f (cdr lst))
        )
    )
)

;;; Tests
(define (even? x)
  (= (modulo x 2) 0))
(filter-lst even? '(0 1 1 2 3 5 8))
; expect (0 2 8)

(define (make-adder num)
    (define (adder x)
        (+ x num)
    )
    adder
)

;;; Tests
(define adder (make-adder 5))
(adder 8)
; expect 13