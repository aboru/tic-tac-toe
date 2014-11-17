#lang racket

#|

  game/utilities.rkt

  Copyright (c) 2014 Anders Borg (see LICENSE for details)

  Provides basic utilities that are used in the game. These utilities include a
  system for managing moves and printing some output.

|#

(provide welcome turn-message change-turn)

(define (welcome)
  (displayln "welcome to Tic-Tac-Toe!"))

(define (turn-message player)
  (display "player ")(display player)(displayln " make your move"))

(define (change-turn turn)
  (+ (modulo turn 2) 1))
