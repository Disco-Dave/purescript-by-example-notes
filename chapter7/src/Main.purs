module Main where

import Prelude

import Data.Maybe
import Effect (Effect)
import Effect.Console (log)
import Control.Apply

main :: Effect Unit
main = do
  log "🍝"

mayAdd :: forall n . Semiring n => Maybe n -> Maybe n -> Maybe n
mayAdd = lift2 add

maySub :: forall n . Ring n => Maybe n -> Maybe n -> Maybe n
maySub = lift2 sub

mayMul :: forall n . Semiring n => Maybe n -> Maybe n -> Maybe n
mayMul = lift2 mul

mayDiv :: forall n . EuclideanRing n => Maybe n -> Maybe n -> Maybe n
mayDiv = lift2 div

combineMaybe :: forall a f. Applicative f => Maybe (f a) -> f (Maybe a)
-- This is sequence (https://pursuit.purescript.org/packages/purescript-foldable-traversable/4.1.1/docs/Data.Traversable#v:sequence)
combineMaybe (Just x) = Just <$> x
combineMaybe Nothing = pure Nothing


