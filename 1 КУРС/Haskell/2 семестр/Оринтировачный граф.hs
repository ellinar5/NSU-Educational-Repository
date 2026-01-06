import Data.Graph
import Data.Array
import qualified Data.Set as Set

-- Определяем граф
graf :: Graph
graf = buildG (1, 6) [(1, 3), (3, 2), (3, 4), (2, 1), (4, 1), (5, 4), (5, 6), (6, 6)]

-- Функция для выполнения обхода в глубину
bypass :: Graph -> Vertex -> Vertex -> Set.Set Vertex -> Bool
bypass graph current target visited
  | current == target = True -- Если текущая вершина равна целевой, возвращается True, что означает, что путь найден
  | Set.member current visited = False -- Если текущая вершина уже посещена, возвращается False, чтобы избежать зацикливания
  | otherwise =
     let visited' = Set.insert current visited -- Добавляем текущую вершину в множество посещенных.
         neighbors = graph ! current -- Получаем соседей текущей вершины.
     in any (\neighbor -> bypass graph neighbor target visited') neighbors -- Рекурсивно проверяем соседей. 
   
   -- Функция для выполнения обхода в ширину
bfs :: Graph -> Vertex -> Set.Set Vertex -> [Vertex] -> Bool
bfs graph target visited queue
  | null queue = False -- Если очередь пуста, значит мы не нашли целевую вершину
  | current == target = True -- Если текущая вершина равна целевой, возвращается True
  | Set.member current visited = bfs graph target visited restQueue -- Если текущая вершина уже посещена, продолжаем с остатка очереди
  | otherwise = bfs graph target (Set.insert current visited) (restQueue ++ neighbors) -- Добавляем текущую вершину в посещенные и добавляем соседей в очередь
  where
    current = head queue
    restQueue = tail queue
    neighbors = graph ! current

-- Функция для инициализации обхода в ширину
canReachBFS :: Graph -> Vertex -> Vertex -> Bool
canReachBFS graph start target = bfs graph target Set.empty [start]

-- Функция для инициализации обхода
canReach :: Graph -> Vertex -> Vertex -> Bool
canReach graph start target = bypass graph start target Set.empty 


  
-- В глубину
mainDFS :: IO ()
mainDFS = do
    let startVertex = 1
        targetVertex = 6
    print $ canReach graf startVertex targetVertex  -- Проверяем, можно ли добраться от 1 до 2

-- В ширину
mainBFS :: IO ()
mainBFS = do
    let startVertex = 1
        targetVertex = 4
    print $ canReachBFS graf startVertex targetVertex  -- Проверяем, можно ли добраться от 1 до 2

main :: IO ()
main = do
    putStrLn "Результат обхода в глубину:"
    mainDFS
    putStrLn "Результат обхода в ширину:"
    mainBFS