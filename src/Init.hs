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
  basePath <- if null fp
    then getCurrentDirectory >>= parseAbsDir
    else parseSomeDir fp >>= \case
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


-- path <- parseAbsDir fp
-- (rootPath, gitPath) <- createPaths path -- Create root and git paths
-- createDirs -- Create object and refs directories
-- putStrLn "Initialised empty Hit repository in " <> gitPath
-- where
-- -- 1. Create a root path
-- -- 2. Inside the root path, create a .git folder
-- createPaths = _a
-- -- 1. Inside the .git folder, create an objects folder
-- -- 2. Inside the .git folder, create an refs folder
-- createDirs = _b

-- Hit init "/path/repo"
