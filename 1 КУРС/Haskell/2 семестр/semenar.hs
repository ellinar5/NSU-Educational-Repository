import System.Environment
-- 1. getLain должен вызван 3 раза, а потом напечатать результат используя mapM_
-- нужно отбросить аргумент при использувание  mapM с getLain для достяжения используя (\_ ->)

-- getLain :: IO String
-- getLain = return "A lot of getLain"

main :: IO ()
main = do
    _ <- getArgs
    results <- mapM (\_ -> getLain) [1..3]
    mapM_ putStrLn results
		
-- 2. сообственная функция replicateM под названием myVersionM, используя mapM (минус тип аннотации) 

myVersionM :: Monad m => Int -> m a -> m [a]
myVersionM n action = mapM (\_ -> action) [1..n]

getLain :: IO String
getLain = return "A lot of myVersionM"

main1 :: IO ()
main1 = do
    _ <- getArgs
    results <- myVersionM 5 getLain
    mapM_ putStrLn results