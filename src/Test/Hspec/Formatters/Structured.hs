module Test.Hspec.Formatters.Structured where

import Test.Hspec.Formatters
import Data.List


structured :: Formatter
structured = silent {
  exampleSucceeded = \p ->
    write $ "Just (" ++ formatPath p ++",\"passed\",\"\"),"
, exampleFailed    = \p result -> case result of
      (Right e) -> write $ "Just (" ++ formatPath p ++",\"failed\","++ show e ++"),"
      (Left e)  -> write $ "Just (" ++ formatPath p ++",\"failed\","++ (show.show) e ++"),"
, headerFormatter  = write $ "["
, footerFormatter  = write $ "Nothing]"
}

formatPath (ps, p) = show.intercalate " " $ (ps ++ [p])