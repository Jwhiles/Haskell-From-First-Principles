module Addition where

import Test.Hspec

dividedBy :: Integral a => a -> a -> (a, a)
dividedBy num denom = go num denom 0
  where go n d count
          | n < d = (count, n)
          | otherwise = go (n - d) d (count + 1)

intermission :: (Eq a, Num a) => a -> a -> a
intermission n c = go n c 0
  where go n c s
           | c == 0 = s
           | otherwise = go n (c - 1) (s + n)

main :: IO ()
main = hspec $ do
  describe "dividedBy" $ do
    it "15 divided by 3 is 5" $ do
      dividedBy 15 3 `shouldBe` (5, 0)
    it "22 divided by 5 is 4, remainder 2" $ do
      dividedBy 22 5 `shouldBe` (4, 2)
  describe "intermission func" $ do
    it "4 times 10 is 40" $ do
      intermission 4 10 `shouldBe` 40

