#lang racket

#|

  board.rkt

  Copyright (c) 2014 Anders Borg (see LICENSE for details)

  Provides the board functions that allow for manipulation of the board. Uses a
  module to do complex tasks, and provides the utilities to external systems.

|#

(require "board-generator.rkt")
(provide create-board access change-value)

(define (create-board) (generate))

(define (change-value) (modify))

(define (access board x y)
  (list-ref (list-ref board y) x))
  
(define (show board)
  (displayln "  A B C")
  (display "1 ")(display (access board 0 0))(display "|")
  (display (access board 1 0))(display "|")(displayln (access board 2 0))
  (displayln "  -----")
  (display "2 ")(display (access board 0 1))(display "|")
  (display (access board 1 1))(display "|")(displayln (access board 2 1))
  (displayln "  -----")
  (display "3 ")(display (access board 0 2))(display "|")
  (display (access board 1 2))(display "|")(displayln (access board 2 2)))
