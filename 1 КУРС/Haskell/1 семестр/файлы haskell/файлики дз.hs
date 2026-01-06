import System.Directory (doesFileExist)
import System.IO
import Data.Time

askName :: IO (String)
askName = do
    putStrLn "What is your name?"
    name <- getLine
    return (name)

askBirthday :: IO String
askBirthday = do
    putStrLn "What is your birth date? (DD.MM.GGGG)"
    birthday <- getLine
    return birthday

main :: IO ()
main = do
    fileExists <- doesFileExist "file.txt"
    if fileExists
        then do
            name <- getNameFromFile "file.txt"
            putStrLn ("Hello, " ++ name ++ ", welcome back.")
        else do
            name <- askName
            birthday <- askBirthday
            saveData "file.txt" name birthday

getNameFromFile :: FilePath -> IO String
getNameFromFile fn = do
    file <- openFile fn ReadMode
    hSetEncoding file utf8
    contents <- hGetContents file
    return $ head $ lines cnt

saveData :: FilePath -> String -> String -> String -> IO ()
saveData fn name = do
    file <- openFile fn WriteMode
    hSetEncoding file utf8
    hPutStrLn file (name ++ "\n" ++ birthday)
    hClose file