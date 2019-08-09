module Data.AddressBook where

import Prelude

import Control.Plus (empty)
import Data.List (List(..), filter, head)
import Data.Maybe (Maybe)

type Entry =
    { firstName :: String
    , lastName :: String
    , address :: Address
    }

showEntry :: Entry -> String
showEntry entry =
    entry.lastName <> ", " 
    <> entry.firstName <> ": " 
    <> showAddress entry.address

type Address =
    { street :: String
    , city :: String
    , state :: String
    }

showAddress :: Address -> String
showAddress address =
    address.street <> ", " 
    <> address.city <> ", " 
    <> address.state

type AddressBook = List Entry
