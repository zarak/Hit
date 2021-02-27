module Main where

import qualified MyLib (inflate)

main :: IO ()
main = do
  putStrLn "Hello, Haskell!"
  MyLib.inflate
