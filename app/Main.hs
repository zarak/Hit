module Main where

import Init (initRepository)
import Workspace (listFiles)
import Params (Params (..), cmdLineParser, command)
import System.Environment

main :: IO ()
main = cmdLineParser >>= work

work :: Params -> IO ()
work params = do
  case command params of
    "init" -> initRepository $ repoPath params
    "commit" -> listFiles "." >>= print 
    _ -> pure ()
