#lang racket

;; https://github.com/jgrodziski/set-game

(define cards (cartesian-product '(oval diamond squiggle)
                                 '(red purple green)
                                 '(1 2 3)
                                 '(solid striped outline)))

(define all-same-or-all-different?
  (lambda args
    (let ([a (apply set args)])
      (or (= 1 (set-count a))
          (= (length args) (set-count a))))))

(define (set-of-cards? c1 c2 c3)
  (andmap all-same-or-all-different? c1 c2 c3))

(define deck (take (shuffle cards) 12))

(pretty-display deck)

(pretty-display
 (filter
 (lambda (s) (apply set-of-cards? s))
 (combinations deck 3)))
