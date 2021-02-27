module Init
  ( 
  ) where

import Params (cmdLineParser, Params(..))

init :: Params -> IO ()
init params = do
  _readParams -- Read command line arguments
  _createPaths -- Create root and git paths
  _createDirs -- Create object and refs directories
