module Data.AddressBook where

import Prelude

import Control.Plus (empty)
import Data.List (List, filter, head, (:), nubBy)
import Data.Maybe (Maybe, isNothing)

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

emptyBook :: AddressBook
emptyBook = empty

insertEntry :: Entry -> AddressBook -> AddressBook
insertEntry = (:)

data EntryQuery
    = ByName {firstName :: String, lastName :: String}
    | ByAddress {street :: String, city :: String, state :: String}

findEntry :: EntryQuery -> AddressBook -> Maybe Entry
findEntry entryQuery = head <<< filter (isEntry entryQuery)
    where isEntry (ByName nameQuery) entry = 
            nameQuery.firstName == entry.firstName && nameQuery.lastName == entry.lastName
          isEntry (ByAddress addressQuery) entry =
              addressQuery.street == entry.address.street && 
              addressQuery.city == entry.address.city && 
              addressQuery.state == entry.address.state

containsEntry :: String -> String -> AddressBook -> Boolean
containsEntry firstName lastName = isNothing <<< findEntry query
    where query = ByName {firstName : firstName, lastName : lastName}

removeDuplicates :: AddressBook -> AddressBook
removeDuplicates = nubBy isDup
    where isDup entry1 entry2 = entry1.firstName == entry2.firstName && 
                                entry1.lastName == entry2.lastName
