#lang racket

#|

  board-generator.rkt

  Copyright (c) 2014 Anders Borg (see LICENSE for details)

  Provides a board generator for a game of tic-tac-toe. The board consists of a
  list of lists creating a 3x3 board to play the game on.

|#

(provide generate modify)

(define (generate)
  (list (list " " " " " ") (list " " " " " ") (list " " " " " ")))

(define (update vals x value)
  (cond
    [(eq? x 0) (list value (list-ref vals 1) (list-ref vals 2))]
    [(eq? x 1) (list (list-ref vals 0) value (list-ref vals 2))]
    [(eq? x 2) (list (list-ref vals 0) (list-ref vals 1) value)]
    [else vals]))

(define (modify board x y value)
  (cond
    [(eq? y 0) (cons (update (list-ref board 0) x value) (cdr board))]
    [(eq? y 1) (list (list-ref board 0) (update (list-ref board 1) x value) (list-ref board 2))]
    [(eq? y 2) (list (list-ref board 0) (list-ref board 1) (update (list-ref board 2) x value))]
    [else board]))
