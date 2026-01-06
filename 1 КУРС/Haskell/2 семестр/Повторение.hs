import Data.List

-- #0 Выдает Hi, ... ! если есть имя. Если нет, то зацикливает What is your name? пока не будет введенно имя

nameof :: IO ()
nameof = do
		putStrLn "What is your name?"
		name <- getLine 
		if null name -- пустой список
			then nameof -- по-новой запрашиваем имя
		else  putStrLn ("Hi, " ++ name ++ "!")

-- #1 Создаем тип данных Person и конкретного персонажа p1

data Person = Person {
  name :: String,
  age :: Int,
  weight :: Double} deriving (Eq,Show,Read)
p1 :: Person
p1 = Person "Ivan" 54 36.8 

p2 :: Person
p2 = Person "Eva" 45 57.8 

-- Вывести в текстовой файл данные из p1 с помощью метода show
main :: IO ()
main = do
		let personText1 = show p1 
		writeFile "person.txt" personText1
		putStrLn "Успешная запись файла"
		
		-- Прочитать из текстового файла эти данные с помощью метода read для "переменной" типа (p2 :: Person)
		personText2 <- readFile "person.txt"
		let p2FromFile = read personText2 :: Person
		putStrLn "Успешная считавание файла"
		
		-- Пусть теперь в файле три строки, в произвольном порядке нужно организовать ввод и вывод в файл для того же самого типа данных
		personText3 <- openFile "person.txt" WriteMode
		let 
		
		
