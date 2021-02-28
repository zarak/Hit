{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TemplateHaskell #-}

module Init
  ( initRepository,
  )
where

import Control.Exception ( IOException, handle )
import Control.Exception.Base ()
import Control.Monad ((>=>))
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
import System.Directory
    ( createDirectoryIfMissing, doesPathExist, getCurrentDirectory )

initRepository :: FilePath -> IO ()
initRepository = do
  createRootDirectory >=> createSubdirectories

createSubdirectories :: Path Abs Dir -> IO ()
createSubdirectories basePath = do
  let gitPath = basePath </> $(mkRelDir ".git")
      objectsPath = gitPath </> $(mkRelDir "objects")
      refsPath = gitPath </> $(mkRelDir "refs")
      createDirectories = handle handler . createDirectoryIfMissing True . fromAbsDir
  doesPathExist (fromAbsDir gitPath) >>= \exists ->
    if exists
       -- TODO: Throw an exception
      then putStrLn "Directory already exists"
      else do
        mapM_ createDirectories [gitPath, objectsPath, refsPath]
        putStrLn $ "Initialized empty Hit repository in " <> fromAbsDir gitPath

createRootDirectory :: FilePath -> IO (Path Abs Dir)
createRootDirectory fp = do
  if null fp
    then getCurrentDirectory >>= parseAbsDir
    else
      parseSomeDir fp >>= \case
        Abs path -> pure path
        Rel relPath -> do
          currentDir <- getCurrentDirectory >>= parseAbsDir
          pure $ currentDir </> relPath

handler :: IOException -> IO ()
handler = print
