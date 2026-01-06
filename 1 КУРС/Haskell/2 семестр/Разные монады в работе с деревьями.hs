import Control.Monad.Writer
-- 1.заданное дерево
data ATree a = ALeaf a | ABranch (ATree a) a (ATree a) deriving (Show, Read)

dTree :: ATree Double
-- dTree = ABranch (ABranch (ALeaf 21) 2.2 (ABranch (ABranch (ALeaf 62) 0 (ALeaf 66)) 22 (ALeaf 46))) 1.1 (ABranch (ALeaf 34) 3.3 (ALeaf 35))
dTree = ABranch (ABranch (ALeaf 21) 2.2 (ABranch (ABranch (ALeaf 62) 43 (ALeaf 66)) 22 (ALeaf 46))) 1.1 (ABranch (ALeaf 34) 3.3 (ALeaf 35))

-- произведение всех вершин
-- *Вернуть (Just ..), если это возможно, Nothing -- если невозможно
dM :: ATree Double -> Maybe Double
dM (ALeaf x) 
  | x /= 0 = Just x -- не равен нулю
  | otherwise = Nothing

dM (ABranch left x right) = do -- обработка веток (левого и правого) и достаем из Maybe
  leftBranch <- dM left
  rightBranch <- dM right
  let total = x * leftBranch * rightBranch
  if total /= 0 then Just total else Nothing

-- Основная функция для деления на произведение всех значений в дереве
divWithTreeM :: Double -> ATree Double -> Maybe Double
divWithTreeM n tree = do
  pull1 <- dM tree  -- вычисляем произведение и получаем Maybe Double
  if pull1 /= 0 then Just (n / pull1) else Nothing -- Если какая-то вершина содержит 0, то на этом шаге (и далее) должно выйти Nothing.


main :: IO ()
main = do
    let tree = dTree  
    let number = 1000.0  
    case divWithTreeM number tree of
        Just result -> putStrLn $ "Результат деления: " ++ show result
        Nothing     -> putStrLn "Деление невозможно (в дереве содержится ноль)."

-- 2. Пусть теперь дерево помимо значений, содержит ID для каждой вершины
idTree :: ATree (Int,Double)
idTree =
    ABranch
       (
         ABranch
            (ALeaf (4,21))
              (2,2.2)
            (
              ABranch
                 (
                   ABranch
                     (ALeaf (100,62))
                       (7,40)
                     (ALeaf (200,66))
                 )
                     (5,22)
                  (ALeaf (203,46))
            )

       )
             (1,1.1)
     (
       ABranch
         (ALeaf (301,34))
            (3,3.3)
         (ALeaf (307,1))
     )
	 
-- построить функцию, которая возвращает (Right ..), если это возможно.
-- если какая-то вершина содержит 0, то вернуть что-то типа (Left "smth. wrong with ID 307").
dE :: ATree (Int, Double) -> Either String Double
dE (ALeaf (id, x)) 
	| x /= 0 = Right x
	| otherwise  = Left $ "smth. wrong with ID 307 " ++ show id
	
dE (ABranch left(id,x) right) = do -- обработка веток (левого и правого) и достаем из Maybe
  leftBranch <- dE left
  rightBranch <- dE right
  let total = x * leftBranch * rightBranch
  if total /= 0 then Right total else Left "В дереве содержится ноль"

-- Если вершин с нулями несколько, то вернуть сообщение с ID вершины первого встреченного нуля.
divWithTreeE :: Double -> ATree (Int,Double) -> Either String Double
divWithTreeE n tree = do
  pull2 <- dE tree  
  if pull2 /= 0 then Right (n / pull2) else Left "В дереве содержится ноль" 
  
main1 :: IO ()
main1 = do
  let result = divWithTreeE 100 idTree
  case result of
    Right value -> putStrLn $ "Результат: " ++ show value
    Left errMsg -> putStrLn $ "Ошибка: " ++ errMsg
	
-- 3. С деревом idTree из задачи-2 найти сумму вершин (Double), но при этом вести журналирование: ID какой вершины в текущий момент обрабатывается.
sumWithTreeE :: ATree (Int, Double) -> Writer String Double

sumWithTreeE (ALeaf (id, value)) = do
    tell $ "Обрабатывается лист с ID: " ++ show id ++ "\n"
    return value
	
sumWithTreeE (ABranch left (id, value) right) = do
    leftSum <- sumWithTreeE left
    rightSum <- sumWithTreeE right
    return (leftSum + rightSum + value)

main2 :: IO ()
main2 = do
    let (totalSum, log) = runWriter (sumWithTreeE idTree)
    putStrLn $ "Сумма значений: " ++ show totalSum
    putStrLn "Журнал обработки:"
    putStrLn log
	
--4. Для дерева dTree из задачи-1 построить дерево типа ATree (Int,Double), перенумеровав вершины
-- и добавив последовательно номера (ID) к значениям, т.е. построить функцию с такой сигнатурой

numTree :: ATree Double -> ATree (Int, Double)
numTree tree = fst $ numTreeHelper tree 1

-- Вспомогательная функция для перенумеровки с отслеживанием текущего ID
numTreeHelper :: ATree Double -> Int -> (ATree (Int, Double), Int)
numTreeHelper (ALeaf value) idCounter =
    (ALeaf (idCounter, value), idCounter + 1)
numTreeHelper (ABranch left value right) idCounter =
    let (newLeft, newCounter) = numTreeHelper left idCounter
        (newRight, finalCounter) = numTreeHelper right newCounter
    in (ABranch newLeft (newCounter, value) newRight, finalCounter)

-- Пример использования
main3 :: IO ()
main3 = do
    let numberedTree = numTree dTree
    print numberedTree