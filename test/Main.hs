module Main (spec, main) where

import Test.Hspec
import Test.QuickCheck
import ComputeHashes

main :: IO ()
main = hspec spec

spec :: Spec
spec =
  describe "Compute hashes" $ do
    it "should compute the correct sha-1 hash of a string" $ do
      let string = "hello\n"
      toHex (hashString string) `shouldBe` "f572d396fae9206628714fb2ce00f72e94f2258f"

      
