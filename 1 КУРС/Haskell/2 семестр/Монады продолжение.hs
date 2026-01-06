import System.Environment

-- 1. getLain должен вызван 3 раза, а потом напечатать результат используя mapM_
-- нужно отбросить аргумент при использувание  mapM с getLain для достяжения используя (\_ ->)

getLain :: IO String
getLain = return "A lot of getLain"

main :: IO ()
main = do
    _ <- getArgs
    result <- getLain 
    mapM_ (const (putStrLn result)) [1..3]
	
-- 2. пока пользователь не вел n не заканчивать код

forExpressions :: String -> Int
forExpressions expr = case words expr of
    [x, op, y] | op == "+" -> read x + read y
               | op == "*" -> read x * read y
               | otherwise  -> 0

main1:: IO ()
main1 = do
    putStrLn "Enter the expression (or 'n' to exit):"
    input <- getLine
    if input == "n"
        then putStrLn "exit"
        else do
            let result = forExpressions input
            putStrLn $ "result: " ++ show result
            main1 -- повторять до того момента пока не введена n
			
-- 3. Задача про цитату

quote :: Int -> String 
quote expr = case words expr of
    [x, op, y] | op == "+" -> read x + read y
               | op == "*" -> read x * read y
               | otherwise  -> 0

