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
  handle handler $ createDirectory $ fromAbsDir gitPath
  createDirectory $ fromAbsDir objectsPath
  createDirectory $ fromAbsDir refsPath

handler :: IOException -> IO ()
handler e = print e
