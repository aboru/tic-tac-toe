#lang racket

#|

  io/input.rkt

  Copyright (c) 2014 Anders Borg (see LICENSE for details)

  Provides functions for user input and input checking. Calling the function we
  export provides a guaranteed input that is valid by asking for input over til
  the input is correct.

|#

(provide get-y-move get-x-move)

(define (convert-input value)
  (cond
    [(or (eq? value (string->symbol "A")) (eq? value (string->symbol "a"))) 1]
    [(or (eq? value (string->symbol "B")) (eq? value (string->symbol "b"))) 2]
    [(or (eq? value (string->symbol "C")) (eq? value (string->symbol "c"))) 3]
    [else #f]))

(define (get-y-move)
  (display "please provide the move y coordinate: ")
  (let ([value (read)])
    (if (and (>= value 1) (<= value 3)) (- value 1) (get-y-move))))

(define (get-x-move)
  (display "please provide the move x coordinate: ")
  (let ([value (convert-input (read))])
    (if (not (eq? value #f)) (- value 1) (get-x-move))))
