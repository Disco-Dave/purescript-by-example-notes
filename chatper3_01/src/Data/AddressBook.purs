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

findEntry :: AddressQuery -> AddressBook -> Maybe Entry
findEntry query = head <<< filter (filterEntry query)
    where 
          filterEntry :: AddressQuery -> Entry -> Boolean
          filterEntry (ByName name) entry = name.firstName == entry.firstName && name.firstName == entry.lastName
          filterEntry (ByAddress query') entry = false

