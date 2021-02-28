module Workspace
  ( 
  ) where

import Path
import System.Directory

listFiles :: FilePath -> IO [FilePath]
listFiles  = listDirectory
