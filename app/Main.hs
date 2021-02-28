module Main where

import Params (Params (..), cmdLineParser)
import System.Environment

-- import Init (initRepository)

-- main :: Params -> IO ()
-- main params =
-- putStrLn "Test"

main :: IO ()
main = getArgs >>= mapM_ putStrLn
