#lang racket

#|

  board.rkt

  Copyright (c) 2014 Anders Borg (see LICENSE for details)

  Provides the board functions that allow for manipulation of the board. Uses a
  module to do complex tasks, and provides the utilities to external systems.

|#

(require "board-generator.rkt")

(provide create-board access show check-cat check-win)

(define (create-board) (generate))

(define (access board x y)
  (list-ref (list-ref board y) x))

(define (cat-row-test values)
  (cond
    [(eq? " " (list-ref values 0)) #f]
    [(eq? " " (list-ref values 1)) #f]
    [(eq? " " (list-ref values 2)) #f]
    [else #t]))

(define (check-cat board)
  (cond
    [(eq? (cat-row-test (list-ref board 0)) #f) #f]
    [(eq? (cat-row-test (list-ref board 1)) #f) #f]
    [(eq? (cat-row-test (list-ref board 2)) #f) #f]
    [else #t]))

(define (check one two three value)
  (and (eq? value one) (eq? value two) (eq? value three)))

(define (check-win board value)
  (cond
    [(check (access board 0 0) (access board 1 0) (access board 2 0) value) #t]
    [(check (access board 0 1) (access board 1 1) (access board 2 1) value) #t]
    [(check (access board 0 2) (access board 1 2) (access board 2 2) value) #t]
    [(check (access board 0 0) (access board 0 1) (access board 0 2) value) #t]
    [(check (access board 1 0) (access board 1 1) (access board 1 2) value) #t]
    [(check (access board 2 0) (access board 2 1) (access board 2 2) value) #t]
    [(check (access board 0 0) (access board 1 1) (access board 2 2) value) #t]
    [(check (access board 2 0) (access board 1 1) (access board 0 2) value) #t]
    [else #f]))

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
