{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TemplateHaskell #-}
module Commit
    ( 
    ) where

import Path
    ( (</>),
      fromAbsDir,
      mkRelDir,
      parseAbsDir,
      parseSomeDir,
      Path,
      Abs,
      Dir,
      Rel,
      SomeBase(Rel, Abs) )
import System.Directory ( getCurrentDirectory )
import Workspace (listFiles)

commit :: IO ()
commit = do
    rootPath <- getCurrentDirectory >>= parseAbsDir
    let gitPath = rootPath </> $(mkRelDir ".git")
        dbPath = gitPath </> $(mkRelDir "objects")
    files <- listFiles $ fromAbsDir rootPath
    mapM_ saveBlob files

saveBlob :: FilePath -> IO ()
saveBlob  = undefined
