{-# LANGUAGE OverloadedStrings #-}

module ComputeHashes
  ( hashString,
    toHex,
  )
where

import Codec.Compression.Zlib
import Crypto.Hash.SHA1 (hashlazy)
import qualified Data.ByteString as Strict
import qualified Data.ByteString.Base16 as B16
import qualified Data.ByteString.Lazy as Lazy
import qualified Data.Text as T
import qualified Data.Text.Encoding as T
import System.Process (system)
import Text.Printf (printf)

run :: IO ()
run = do
  -- hashFile path >>= putStrLn . toHex
  let string = "hello\n"
  putStrLn $ "raw: " ++ toHex (hashString string)

toHex :: Strict.ByteString -> String
toHex bytes = Strict.unpack bytes >>= printf "%02x"

hashString :: String -> Strict.ByteString
hashString = hashlazy . Lazy.fromStrict . T.encodeUtf8 . T.pack
