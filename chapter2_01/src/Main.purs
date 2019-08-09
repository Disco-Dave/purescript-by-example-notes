module Main where

import Prelude
import Effect (Effect)
import Effect.Console (logShow)
import Math (sqrt, pi)

diagonal :: Number -> Number -> Number
diagonal w h = sqrt (w * w + h * h)

circleArea :: Number -> Number
circleArea radius = 2.0 * pi * (radius * radius)

main :: Effect Unit
main = do
  logShow $ diagonal 2.3 2.3
