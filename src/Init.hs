module Init
  ( initRepository,
  )
where

import System.Directory (getCurrentDirectory)

initRepository :: FilePath -> IO ()
initRepository fp = do
  path <- getCurrentDirectory
  (rootPath, gitPath) <- createPaths path -- Create root and git paths
  createDirs -- Create object and refs directories
  putStrLn "Initialised empty Hit repository in " <> gitPath
  where
    -- 1. Create a root path
    -- 2. Inside the root path, create a .git folder
    createPaths = _a
    -- 1. Inside the .git folder, create an objects folder
    -- 2. Inside the .git folder, create an refs folder
    createDirs = _b
