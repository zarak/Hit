{-# LANGUAGE OverloadedStrings #-}

module ComputeHashes (
  hashString,
  toHex,
  numBytesUtf8,
  string,
  blob,
  compressed,
  hashlazy,
) where

import Codec.Compression.Zlib
import Crypto.Hash.SHA1 (hashlazy)
import qualified Data.ByteString as Strict
import qualified Data.ByteString.Base16 as B16
import qualified Data.ByteString.Lazy as Lazy
import qualified Data.Text as T
import qualified Data.Text.Encoding as T
import System.Process (system)
import Text.Printf (printf)

string = "hello\n"

blob = "blob " <> show (numBytesUtf8 string) <> "\0" <> string

compressed = compress $ Lazy.fromStrict $ T.encodeUtf8 $ T.pack blob

run :: IO ()
run = do
  putStrLn $ "raw: " <> toHex (hashString string)
  putStrLn $ "blob: " <> toHex (hashString blob)
  putStrLn $ "compressed: " <> toHex (hashlazy compressed)

toHex :: Strict.ByteString -> String
toHex bytes = Strict.unpack bytes >>= printf "%02x"

hashString :: String -> Strict.ByteString
hashString = hashlazy . Lazy.fromStrict . T.encodeUtf8 . T.pack

numBytesUtf8 :: String -> Int
numBytesUtf8 = Strict.length . T.encodeUtf8 . T.pack
