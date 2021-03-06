module Ex where

import Control.Monad.Trans.Reader
import Control.Monad.Trans.Maybe
import Control.Monad
import Control.Monad.Trans.State
import Control.Monad.Identity
import Control.Monad.IO.Class


rDec :: Num a => Reader a a
rDec = reader $ (-) 1

rShow :: Show a => ReaderT a Identity String
rShow = reader $ show


rPrintAndInc :: (Num a, Show a) => ReaderT a IO a
rPrintAndInc = ReaderT $ \r -> do
   liftIO (putStrLn $ "hi: " ++ show r)
   return (r + 1)

sPrintIncAccum ::  (Num a, Show a) => StateT a IO String
sPrintIncAccum = StateT $ \s -> do
  liftIO (putStrLn $ "Hi :" ++ show s)
  return (show s, s + 1)

isValid :: String -> Bool
isValid v = elem '!' v

maybeExcite :: MaybeT IO String
maybeExcite = do
  v <- liftIO getLine
  guard $ isValid v
  return v

doExcite :: IO ()
doExcite = do
  putStrLn "say something excite!"
  excite <- runMaybeT maybeExcite
  case excite of
    Nothing -> putStrLn "woo"
    Just e -> 
      putStrLn ("Good woow" ++ e)
