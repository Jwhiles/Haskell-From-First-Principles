import Control.Applicative
data List a =
    Nil
  | Cons a (List a)
  deriving (Eq, Show)


append :: List a -> List a -> List a
append Nil ys = ys
append (Cons x xs) ys = Cons x $ xs `append` ys

fold :: (a -> b -> b) -> b -> List a -> b
fold _ b Nil  = b
fold f b (Cons h t) = f h (fold f b t)

concat' :: List (List a) -> List a
concat' = fold append Nil

flatMap :: (a -> List b) -> List a -> List b
flatMap f as = 

instance Applicative List where
  pure x = (Cons x Nil)
  a <*> b = append a b
