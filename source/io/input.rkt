#lang racket

#|

  io/input.rkt

  Copyright (c) 2014 Anders Borg (see LICENSE for details)

  Provides functions for user input and input checking. Calling the function we
  export provides a guaranteed input that is valid by asking for input over til
  the input is correct.

|#

(require "../board/board.rkt")

(provide move)

(define (spot-taken board)
  (displayln "this location is already occupied, try again")
  (move board))

(define (invalid-input-x)
  (displayln "must supply a letter value in range [a-c]. try again")
  (get-x-move))

(define (invalid-input-y)
  (displayln "must supply a numeric value in range [1-3]. try again")
  (get-y-move))

(define (test-y-numeric value)
  (if (and (>= value 1) (<= value 3)) (- value 1) (invalid-input-y)))

(define (convert-input value)
  (cond
    [(or (eq? value (string->symbol "A")) (eq? value (string->symbol "a"))) 1]
    [(or (eq? value (string->symbol "B")) (eq? value (string->symbol "b"))) 2]
    [(or (eq? value (string->symbol "C")) (eq? value (string->symbol "c"))) 3]
    [else #f]))

(define (get-y-move)
  (display "please provide the move y coordinate: ")
  (let ([value (read)])
    (cond
      [(number? value) (test-y-numeric value)]
      [else (invalid-input-y)])))

(define (get-x-move)
  (display "please provide the move x coordinate: ")
  (let ([value (convert-input (read))])
    (if (not (eq? value #f)) (- value 1) (invalid-input-x))))

(define (move board)
  (let ([x (get-x-move)] [y (get-y-move)])
    (if (not (eq? " " (access board x y)))(spot-taken board)(list x y))))
