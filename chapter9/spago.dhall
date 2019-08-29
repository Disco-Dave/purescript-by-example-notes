{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name =
    "my-project"
, dependencies =
    [ "arrays"
    , "canvas"
    , "console"
    , "control"
    , "effect"
    , "foldable-traversable"
    , "math"
    , "partial"
    , "psci-support"
    , "random"
    , "refs"
    ]
, packages =
    ./packages.dhall
, sources =
    [ "src/**/*.purs", "test/**/*.purs" ]
}
