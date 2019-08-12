module Main where

import Prelude
import Math ((%))
import Data.Int (toNumber)
import Data.Array(head, tail, filter, length, (..))
import Data.Maybe (fromMaybe)
import Effect (Effect)
import Effect.Console (log)
import Control.MonadZero (guard)

isEven :: Int -> Boolean
isEven n = (toNumber n % 2.0) == 0.0

count :: (Int -> Boolean) -> Array Int -> Int
count pred [] = 0
count pred a = 
  if pred h
    then 1 + count pred t
    else count pred t
  where h = fromMaybe 0 $ head a
        t = fromMaybe [] $ tail a

countEvens :: Array Int -> Int
countEvens = count isEven

countEvens2 :: Array Int -> Int
countEvens2 = length <<< filter isEven

computeSquares :: forall f. Functor f => f Int -> f Int
computeSquares = map (\i -> i * i)

removeNegatives :: Array Int -> Array Int
removeNegatives a = (_ < 0) <$?> a

infix 8 filter as <$?>

factors :: Int -> Array (Array Int)
factors n = do
  i <- 1 .. n
  j <- i .. n
  guard $ i * j == n
  pure [i, j]

isPrime :: Int -> Boolean
isPrime = (_ == 1) <<< length <<< factors 

data Tuple a b = Tuple a b

instance showTuple :: (Show a, Show b) => Show (Tuple a b) where
  show (Tuple a b) = "(" <> show a <> ", " <>  show b <> ")"

cartesianProduct :: forall a b. Array a -> Array b -> Array (Tuple a b)
cartesianProduct arrayA arrayB = do
  a <- arrayA
  b <- arrayB
  pure $ Tuple a b

main :: Effect Unit
main = do
  log "🍝"
