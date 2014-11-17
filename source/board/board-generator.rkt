#lang racket

#|

  board-generator.rkt

  Copyright (c) 2014 Anders Borg

  Provides a board generator for a game of tic-tac-toe. The board consists of a
  list of lists creating a 3x3 board to play the game on.

|#

(provide generate)

(define (generate)
  (list (list " " " " " ") (list " " " " " ") (list " " " " " ")))
