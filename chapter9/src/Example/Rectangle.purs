module Example.Rectangle where

import Prelude
import Effect (Effect)
import Data.Maybe (Maybe(..))
import Graphics.Canvas (rect, fillPath, setFillStyle, getContext2D, getCanvasElementById)
import Partial.Unsafe (unsafePartial)

main :: Effect Unit
main = void $ unsafePartial do
  Just canvas <- getCanvasElementById "canvas"
  ctx <- getContext2D canvas

  void $ setFillStyle ctx "#551a8b"

  fillPath ctx $ rect ctx
    { x: 250.0
    , y: 220.0
    , width: 200.0
    , height: 100.0
    }
