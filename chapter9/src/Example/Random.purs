module Example.Random where

import Prelude
import Effect.Random (random)
import Effect (Effect)
import Data.Maybe (Maybe(..))
import Graphics.Canvas (getContext2D, getCanvasElementById, fillPath, strokePath, arc, setFillStyle, setStrokeStyle)
import Partial.Unsafe (unsafePartial)
import Data.Foldable (for_)
import Math as Math
import Data.Array ((..))

main :: Effect Unit
main = void $ unsafePartial do
  Just canvas <- getCanvasElementById "canvas"
  ctx <- getContext2D canvas

  setFillStyle ctx "#FF0000"
  setStrokeStyle ctx "#000000"

  for_ (1 .. 50) $ \_ -> do
    x <- random
    y <- random
    r <- random

    let path = arc ctx
          { x : x * 600.0
          , y : y * 600.0
          , radius: r * 50.0
          , start: 0.0
          , end : Math.pi * 2.0
          }
    
    strokePath ctx path
    fillPath ctx path
