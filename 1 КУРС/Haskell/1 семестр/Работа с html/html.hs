import System.IO
import Text.Regex.PCRE

-- #1 В заданном html-файле посчитать количество символов "<" (что примерно соответствует числу тэгов).
-- main :: IO()
-- main = do
	-- file <- readFile "L1.html"
	-- let str = lines file
	-- print $ foldl (\acc x  -> acc + (length $ filter (== '<') x)) 0 str
	
-- #2 Открыть заданный html-файл построчно и сохранить каждую третью строку в новом файле.
-- main :: IO()
-- main = do 
     -- file <- readFile "L1.html"
     -- let str = lines file
     -- let str2 = [str !! x| x<-[2,5..(length str)]]
     -- writeFile "output.txt" (unlines str2)
	 
-- #3 Из заданного html-файла в новый файл выписать все URL из ссылок вида <a href="http://..."
main :: IO()
main = do 
     file <- readFile "L1.html"
     let str = lines file
	 let matches = str =~ ("
