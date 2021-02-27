module Main where

import qualified MyLib (inflate)
import Params (cmdLineParser, Params(..))
import Init (initRepository)

main :: Params -> IO ()
main params = MyLib.inflate
