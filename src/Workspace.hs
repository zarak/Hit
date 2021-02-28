module Workspace
  ( listFiles
  ) where

import Path
import System.Directory (listDirectory)

listFiles :: FilePath -> IO [FilePath]
listFiles  = listDirectory
