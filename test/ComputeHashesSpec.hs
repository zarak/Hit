module ComputeHashesSpec (spec) where

import Test.Hspec
import Test.QuickCheck
import ComputeHashes
import MyLib
import Codec.Compression.Zlib (decompress)

spec :: Spec
spec =
  describe "Compute hashes" $ do
    it "should compute the correct sha-1 hash of a string" $ do
      toHex (hashString string) `shouldBe` "f572d396fae9206628714fb2ce00f72e94f2258f"
    it "should compute the correct hash of a blob" $ do
      toHex (hashString blob) `shouldBe` "ce013625030ba8dba906f756967f9e9ca394464a"
    it "should compute the correct hash of a compressed blob" $ do
      let blob = "blob " <> show (numBytesUtf8 string) <> "\0" <> string
      toHex (hashlazy compressed) `shouldBe` "3a3cca74450ee8a0245e7c564ac9e68f8233b1e8"
