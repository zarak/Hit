module Main where

import Params (Params (..), cmdLineParser, command)
import System.Environment

import Init (initRepository)

main :: IO ()
main = cmdLineParser >>= work

work :: Params -> IO ()
work params = do
  if command params == "init"
     then initRepository $ repoPath params
     else pure ()
