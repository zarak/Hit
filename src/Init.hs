module Init
  ( initRepository
  ) where

initRepository :: FilePath -> IO ()
initRepository fp = do
  _createPaths -- Create root and git paths
  _createDirs -- Create object and refs directories
