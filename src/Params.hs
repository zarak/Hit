module Params
  ( cmdLineParser,
    Params,
    command,
    repoPath,
  )
where

import Options.Applicative (Parser, execParser, fullDesc, help, helper, info, long, metavar, progDesc, strArgument, strOption, value, (<**>))

data Params = Params
  { command :: String,
    repoPath :: FilePath
  }

mkParams :: Parser Params
mkParams =
  Params
    <$> strArgument
      (metavar "command" <> help "Command to invoke")
    <*> strOption
      (long "path" <> help "Path to initialize repository" <> value "")

cmdLineParser :: IO Params
cmdLineParser = execParser opts
  where
    opts =
      info
        (mkParams <**> helper)
        (fullDesc <> progDesc "Version control tool")
