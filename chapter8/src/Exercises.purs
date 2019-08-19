module Exercises where

import Prelude
import Data.Maybe (Maybe)
import Data.Array as Array

third :: forall a. Array a -> Maybe a
third arr = do
  thirdItem <- Array.tail arr >>= Array.tail >>= Array.head
  pure thirdItem
