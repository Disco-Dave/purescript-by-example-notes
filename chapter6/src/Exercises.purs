module Exercises where

import Prelude

newtype Complex = Complex
  { real :: Number
  , imaginary :: Number
  }

instance showComplex :: Show Complex where
  show (Complex {real, imaginary}) = "Real: " <> show real <>" Imaginary: " <> show imaginary

instance eqComplex :: Eq Complex where
  eq (Complex c1) (Complex c2) =
    c1.real == c2.real && c1.imaginary == c2.imaginary
