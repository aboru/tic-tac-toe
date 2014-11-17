#!/usr/bin/env racket
#lang racket

#|

  main.rkt

  Copyright (c) 2014 Anders Borg (see LICENSE for details)

  This is the main file of the project. The main file is reponsible for loading
  the project modules and directing the execution flow to the functions that we
  desire.

  Currently, main is awaiting development of some base modules before it can be
  built properly.

|#

(require
  "io/input.rkt"
  "game/utilities.rkt"
  "board/board.rkt"
  "board/board-generator.rkt")

(define (game-loop board turn)
  (turn-message turn board)
  (let* ([moves (move board)]
         [next (modify board (list-ref moves 0) (list-ref moves 1) (player-value turn))])
    (if (continuation-check next turn)
      (game-loop
        next (change-turn turn))
      (displayln "game over"))))

(define (init-game)
  (welcome)(game-loop (create-board) 1))

(init-game)
