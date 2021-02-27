module Main where

import Codec.Compression.Zlib (decompress)
import qualified Data.ByteString.Lazy as B
import System.IO (readLn)

main :: IO ()
main =
  B.interact decompress
