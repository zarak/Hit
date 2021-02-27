module Params (
  cmdLineParser,
  Params,
) where

import Options.Applicative (Parser, execParser, fullDesc, help, helper, info, metavar, progDesc, strArgument, (<**>))

data Params = Params
  { repoPath :: FilePath
  }

mkParams :: Parser Params
mkParams =
  Params
    <$> strArgument
      (metavar "PATH" <> help "Path to initialize repository")

cmdLineParser :: IO Params
cmdLineParser = execParser opts
  where
    opts =
      info
        (mkParams <**> helper)
        (fullDesc <> progDesc "Version control tool")
