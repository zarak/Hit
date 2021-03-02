module Blob (
  ) where

import Data.ByteString.Lazy (ByteString)

data Blob = Blob
  { content :: ByteString
  , objectType :: String
  }
  deriving (Show)
