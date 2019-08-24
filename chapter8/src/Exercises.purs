module Exercises where

import Prelude
import Data.Array as Array
import Data.Maybe (Maybe)
import Data.List (List(..))

third :: forall a. Array a -> Maybe a
third arr = do
  thirdItem <- Array.tail arr >>= Array.tail >>= Array.head
  pure thirdItem

sums :: Array Int -> Array Int
sums coins = Array.sort coinSums
  where
  uniqueCoins = Array.nub coins

  coinSums = Array.foldM (\a e -> [ a, e + a ]) 0 uniqueCoins

filterM :: forall m a. Monad m => (a -> m Boolean) -> List a -> m (List a)
filterM predicate Nil = pure Nil
filterM predicate (Cons h t) = do
  shouldKeep <- predicate h
  if shouldKeep then
    Cons h <$> filterM predicate t
  else
    filterM predicate t
