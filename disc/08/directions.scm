(define (directions n sym)
    (define (search s exp)
    ; Search an expression s for n and return an expression based on exp.
    (cond ((number? s))
          ((null? s) nil)
          (else (search-list s exp))))

    (define (search-list s exp)
    ; Search a nested list s for n and return an expression based on exp.
    (let ((first )
          (second ))
         (if (null? first) rest first)))
         
    (search (eval sym) sym))
