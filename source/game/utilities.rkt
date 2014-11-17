#lang racket

#|

  game/utilities.rkt

  Copyright (c) 2014 Anders Borg (see LICENSE for details)

  Provides basic utilities that are used in the game. These utilities include a
  system for managing moves and printing some output.

|#

(require "../board/board.rkt")

(provide
  welcome
  turn-message
  change-turn
  player-value
  win-message
  tie-game
  continuation-check)

(define (welcome)
  (displayln "welcome to Tic-Tac-Toe!"))

(define (turn-message player board)
  (display "player ")(display player)(displayln " make your move")(show board))

(define (win-message board player)
  (show board)(display "player ")(display player)(displayln " wins!"))

(define (tie-game board)
  (show board)(displayln "game ended in a cat"))

(define (continuation-check board turn)
  (cond
    [(eq? (check-cat board) #t) (tie-game board) #f]
    [(eq? (check-win board (player-value turn)) #t) (win-message board turn) #f]
    [else #t]))

(define (change-turn turn)
  (+ (modulo turn 2) 1))

(define (player-value player)
  (if (eq? player 1) "X" "O"))
