module ComputeHashes
  ( main
  ) where

import Codec.Compression.Zlib
import Crypto.Hash.SHA1 (hashlazy)
import qualified Data.ByteString.Lazy as Lazy
import qualified Data.ByteString as Strict
import qualified Data.ByteString.Base16 as B16
import qualified Data.ByteString as Data.ByteString.Internal
import System.Process (system)
import Text.Printf (printf)

main :: FilePath -> IO ()
main path = do
  hashFile path >>= putStrLn . toHex
  system $ "sha1sum " ++ path
  pure ()

toHex :: Strict.ByteString -> String
toHex bytes = Strict.unpack bytes >>= printf "%02x"

hashFile :: FilePath -> IO Strict.ByteString
hashFile = fmap hashlazy . Lazy.readFile
