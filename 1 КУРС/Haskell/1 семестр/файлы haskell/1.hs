import Data.Time.Calendar
import Data.Time.Clock
import System.Directory (doesFileExist)
import System.IO
-- putStrLn и getLine
-- main :: IO ()
-- main = do
	-- line <- getLine
	-- if line /= "*" then do	
		-- putStrLn $ reverse line
		-- main
	-- else
		-- return()
		
-- вычисление возраста на текущего года +
-- main :: IO ()
-- main = do 
          -- putStrLn "What is u name?"
          -- name <- getLine
          -- putStrLn "Date of birthday"
          -- birthday <- getLine
          -- age <- countAge birthday
          -- putStrLn (name ++ ", your " ++ age ++ " years old")

-- countAge :: String -> IO String
-- countAge s = do cd <- getCurrentTime
                -- let day = read (take 2 s)
                    -- month = read (take 2 $ drop 3 s)
                    -- year = read (drop 6 s)
                    -- diff = diffDays (utctDay cd) (fromGregorian year month day)
                    -- age = show (div diff 365)
                -- return age
				
-- тоже самое, но с файлом
askName :: IO (String,String,String)
askName = do
    putStrLn "What is your name?"
    name <- getLine
    putStrLn "When is your birthday? (DD.MM.YYYY)"
    birthday <- getLine
    age <- countAge birthday
    putStrLn (name++", you are "++age++" years old.")
    return (name,birthday,age)

countAge :: String -> IO String
countAge s = do
    cd <- getCurrentTime
    let
        day = read (take 2 s)
        month = read (take 2 $ drop 3 s)
        year = read (drop 6 s)
        diff = diffDays (utctDay cd) (fromGregorian year month day)
        age = show (diff`div`365)
    return age

main2 :: IO ()
main2 = do
    fe <- doesFileExist "file.txt"
    if fe
    then do
        name <- getNameFromFile "file.txt"
        putStrLn ("Hello, "++name++", welcome back.")
    else do
        (name,birthday,age) <- askName
        saveData "file.txt" name birthday age

getNameFromFile :: FilePath -> IO String
getNameFromFile fn = do
    file <- openFile fn ReadMode
    hSetEncoding file utf8
    cnt <- hGetContents file
    return $ head $ lines cnt

saveData :: FilePath -> String -> String -> String -> IO ()
saveData fn name birthday age = do
    file <- openFile fn WriteMode
    hSetEncoding file utf8
    hPutStrLn file name
    hPutStrLn file birthday
    hPutStrLn file age
    hClose file
				  

				  