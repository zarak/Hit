module MyLib (inflate) where

import Codec.Compression.Zlib (decompress)
import qualified Data.ByteString.Lazy as B
import System.IO (readLn)

inflate :: IO ()
inflate =
  B.interact decompress
