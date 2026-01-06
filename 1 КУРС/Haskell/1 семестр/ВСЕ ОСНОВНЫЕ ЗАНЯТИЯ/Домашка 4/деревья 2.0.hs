-- определить бинарное дерево 
data Tree a = Empty | Node a (Tree a) (Tree a) deriving (Show,Eq)

--задать конткретное дерево
tree1 = Node 1
			 (Node 2
			       (Node 21 Empty Empty)
				   (Node 22 Empty Empty))
			 (Node 3
					(Node 34 Empty Empty)
					(Node 35 
						    (Node 33 Empty Empty)
							( Empty)))
			 
-- Реализовать функцию, которая проверяет, сбалансировано ли дерево
-- если для каждого узла разница высот его левого и правого поддеревьев не превышает 1

-- Реализация:
-- Сравнить друг с другом правое и левое деревья (max и min). 
-- Если они равны или есть разница в 1 - True, иначе False

heightmax :: Tree a -> Int
heightmax Empty = 0
heightmax (Node _ left right) = 1 + (max (heightmax left) (heightmax right))

heightmin :: Tree a -> Int
heightmin Empty = 0
heightmin (Node _ left right) = 1 + (min (heightmin left) (heightmin right))

-- проверка баланса

balans :: Tree a -> Bool
balans tree = abs (heightmax tree - heightmin tree) <= 1