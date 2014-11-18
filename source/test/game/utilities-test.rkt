#lang racket

#|

  game/utilities-test.rkt test

  Copyright (c) 2014 Anders Borg (see LICENSE for details)

  Provides test cases for the utilities module.

|#

(require rackunit
         rackunit/text-ui
         "../../game/utilities.rkt")

(define utilities-tests
  (test-suite "tests for the utilities module"

  (test-case "check change turn function"
    (check = (change-turn 1) 2)
    (check = (change-turn 2) 1))

  (test-case "check player value"
    (check-equal? (player-value 1) "X")
    (check-equal? (player-value 2) "O"))))

(run-tests utilities-tests)
