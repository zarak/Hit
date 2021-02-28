{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TemplateHaskell #-}

module Init
  ( initRepository,
  )
where

import Control.Exception
import Control.Exception.Base
import Path
import System.Directory

initRepository :: FilePath -> IO ()
initRepository fp = do
  basePath <-
    if null fp
      then getCurrentDirectory >>= parseAbsDir
      else
        parseSomeDir fp >>= \case
          Abs path -> pure path
          Rel relPath -> do
            currentDir <- getCurrentDirectory >>= parseAbsDir
            pure $ currentDir </> relPath

  let gitPath = basePath </> $(mkRelDir ".git")
      objectsPath = gitPath </> $(mkRelDir "objects")
      refsPath = gitPath </> $(mkRelDir "refs")
      createDirectories = handle handler . createDirectoryIfMissing True . fromAbsDir
  doesPathExist (fromAbsDir gitPath) >>= \exists ->
    if exists
      then print "Directory already exists"
      else mapM_ createDirectories [gitPath, objectsPath, refsPath]

-- handle handler . createDirectoryIfMissing True . fromAbsDir objectsPath
-- handle handler . createDirectoryIfMissing True . fromAbsDir refsPath

handler :: IOException -> IO ()
handler e = print e
