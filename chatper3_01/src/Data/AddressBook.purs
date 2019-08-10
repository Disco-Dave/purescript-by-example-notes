module Data.AddressBook where

import Prelude

import Control.Plus (empty)
import Data.List (List, filter, head, (:))
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

newtype Address = Address
    { street :: String
    , city :: String
    , state :: String
    }

showAddress :: Address -> String
showAddress (Address address) =
    address.street <> ", " 
    <> address.city <> ", " 
    <> address.state

type AddressBook = List Entry

emptyBook :: AddressBook
emptyBook = empty

insertEntry :: Entry -> AddressBook -> AddressBook
insertEntry = (:)

data AddressQuery
    = ByName {firstName :: String, lastName :: String}
    | ByAddress {street :: String, city :: String, state :: String}

findEntry :: String -> String -> AddressBook -> Maybe Entry
findEntry firstName lastName =
    let isEntry entry = firstName == entry.firstName && lastName == entry.lastName
    in  filter isEntry >>> head
