module MyLib (inflate) where

import System.IO (readLn)
import Codec.Compression.Zlib (decompress)
import qualified Data.ByteString.Lazy as B

inflate :: IO ()
inflate =
  B.interact decompress


