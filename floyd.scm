(define (floyd f x0)
  (define tortoise (f x0))
  (define hare (f (f x0)))

  (let loop ((t tortoise)
             (h hare))
    (if (= t h)
      (begin
        (set! tortoise t)
        (set! hare h)
        'done)
      (loop (f t) (f (f h)))))

  (define mu 0)
  (set! tortoise x0)
  (let loop ((t tortoise)
             (h hare)
             (m mu))
    (if (= t h)
      (begin
        (set! tortoise t)
        (set! hare h)
        (set! mu m)
        'done)
      (loop (f t) (f h) (1+ m))))
  
  mu)

;;;;

;; Example f
(define (f0 x)
  (cond ((= x 0) 6)
        ((= x 1) 6)
        ((= x 2) 0)
        ((= x 3) 1)
        ((= x 4) 4)
        ((= x 5) 3)
        ((= x 6) 3)
        ((= x 7) 4)
        ((= x 8) 0)
        (else 0)))

;; Example x-naught
(define x0 2)

; (floyd f0 x0)
