module Barans (
Sheep,
names,
father,
mother
) where


import Control.Monad
import Data.List

data Tree a = Leaf a | Branch (Tree a) a (Tree a)
type TreeList a = [Tree a]

kolvo :: Tree a -> Int
kolvo (Leaf _ ) = 1
kolvo (Branch l _ r) = kolvo l + kolvo r + 1

content :: Tree a -> a
content (Leaf x)       = x
content (Branch _ x _) = x

type Sheep = String

father' :: Sheep -> Tree Sheep -> Maybe Sheep  -- поиск папы
father' _ (Leaf _) = Nothing
father' s1 (Branch l s2 r) = 
			if (s1==s2)
			then Just (content r)
			else if (father' s1 r == Nothing)
				 then father' s1 l
				 else (father' s1 r)
				 
father'' :: Sheep -> TreeList Sheep -> Maybe Sheep 
father'' _ [] = Nothing
father'' s (x:xs) = (father' s x) `mplus` father'' s xs

father s = father'' s [i10, i12]

mother' :: Sheep -> Tree Sheep -> Maybe Sheep  -- поиск мамы
mother' _ (Leaf _) = Nothing
mother' s1 (Branch l s2 r) = 
			if (s1==s2)
			then Just (content l)
			else if (mother' s1 l == Nothing)
				 then mother' s1 r
				 else (mother' s1 l)
				
mother'' :: Sheep -> TreeList Sheep -> Maybe Sheep 
mother'' _ [] = Nothing
mother'' s (x:xs) = (mother' s x) `mplus` mother'' s xs

mother s = mother'' s [i10, i12]

selected_barans = ["i3", "i5", "i6", "i9", "i12"] -- для номера 5




names' :: Tree Sheep -> [Sheep]
names' (Leaf x)       = [x]
names' (Branch l x r) = (names' l) ++ [x] ++ (names' r)

names'' :: TreeList Sheep -> [Sheep]
names'' [] = []
names'' (x:xs) = (names' x) `mplus` (names'' xs)

names = (sort . nub . names'') [i10, i12]


i8  = Branch (Branch (Leaf "i1") "i3" (Leaf "i2")) "i8" (Leaf "i7")
i9  = Branch (Leaf "i3") "i9" (Leaf "i5")
i10 = Branch i8 "i10" i9
i11 = Branch i8 "i11" i9
i6  = Branch (Leaf "i4") "i6" (Leaf "i5")
i12 = Branch i11 "i12" i6

{--
                      i12
          i10, i11
      i8           i9         i6
   i3    i7     i3   i5    i4    i5
i1    i2

--}
