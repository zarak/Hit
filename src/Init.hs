module Init
  ( initRepository
  ) where

initRepository :: FilePath -> IO ()
initRepository fp = do
  createPaths -- Create root and git paths
  createDirs -- Create object and refs directories
    where
      createPaths = _a
      createDirs = _b
