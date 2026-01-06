-- определение дерева
data ATree a = ALeaf a | ABranch (ATree a) a (ATree a) deriving (Eq)

-- строем дерево

tree1 = 