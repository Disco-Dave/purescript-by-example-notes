module Exercises where

import Prelude

fact :: Int -> Int
fact n
  | n <= 0 = 1
  | otherwise = n * fact (n - 1)

-- An example of row polymorphism
showPerson :: forall r. { first :: String, last :: String | r } -> String
showPerson name = name.first <> ", " <> name.last

type Address
  = { street :: String, city :: String }

type Person
  = { name :: String, address :: Address }

sameCity ::
  forall p a.
  { address :: { city :: String | a } | p } ->
  { address :: { city :: String | a } | p } ->
  Boolean
sameCity { address: { city: firstCity } } { address: { city: secondCity } } = firstCity == secondCity

fromSingleton :: forall a. a -> Array a -> a
fromSingleton default [ a ] = a
fromSingleton default _ = default
