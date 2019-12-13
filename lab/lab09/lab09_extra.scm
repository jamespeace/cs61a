;; Extra Scheme Questions ;;


(define lst
    (cons 
        (cons 1 nil) 
        (cons 2 
            (cons 
                (cons 3 
                    (cons 4 nil)
                )
                (cons 5 nil)
            )
        )
    )
)

(define (composed f g)
    (lambda (x) (f (g x)))
)

(define (remove item lst)
    (if (null? lst)
        nil
        (if (= item (car lst))
            (remove item (cdr lst))
            (cons (car lst) (remove item (cdr lst)))
        )
    )
)


;;; Tests
(remove 3 nil)
; expect ()
(remove 3 '(1 3 5))
; expect (1 5)
(remove 5 '(5 3 5 5 1 4 5 4))
; expect (3 1 4 4)

(define (no-repeats s)
    (cond
        ((null? s) s)
        (else (cons (car s) (no-repeats (
            filter (lambda (x) (not (= x (car s)))) (cdr s)))))
    )
)
(define (in item lst)
    (cond
        ((null? lst) #f)
        ((eq? (car lst) item) #t)
        (else (in item (cdr lst)))
    )
)

(define (no-repeats-helper x l)
    
)

(define (substitute s old new)
  'YOUR-CODE-HERE
)

(define (sub-all s olds news)
  'YOUR-CODE-HERE
)