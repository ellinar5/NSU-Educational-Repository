import System.Random
import Control.Monad
import Data.Maybe
import Data.List
import Data.Char
import GHC.IO

data Symbol = X | O deriving (Show, Eq) -- перечисление для обозначения символов X и O
type Space = Maybe Symbol -- тип, представляющий ячейку поля, которая может быть пустой (Nothing) или содержать символ (X или O)
type Field = [[Space]] -- поле игры (3х3)
type Pos = (Int, Int) -- позиция на поле

initField :: Field -- пустое поле
initField = replicate 3 (replicate 3 Nothing)

randomEl :: Int -> Int -- генерация случайного числа от 0 до n-1.
randomEl n = unsafePerformIO(randomRIO (0, n-1))

printField :: Field -> IO() -- вывод игрового поля на экран
printField field = do
    let n = length field
    putStrLn ('\n' : printField' field n 0 0)

printField' :: Field -> Int -> Int -> Int -> String -- рекурсивная функция для построчного вывода поля.
printField' field count x y | count == y = ""
                            | otherwise = (printRow field count x y) ++ (printField' field count x (y + 1))

printRow :: Field -> Int -> Int -> Int -> String -- вывод строк игрового поля
printRow field count x y | count == x = "\n"
                         | otherwise = (printCell field x y) ++ (printRow field count (x + 1) y)

printCell :: Field -> Int -> Int -> String -- вывод отдельной ячейки (X, O или пустая).
printCell field x y | field !! y !! x == Just X = " X "
                    | field !! y !! x == Just O = " O "
                    | otherwise = " _ "

-- НАДО ДОПОЛНИТЬ (проверка по горизатальной и вертикали)
winCheck :: Field -> Symbol -> Bool -- функция для проверки победителя 			 
winCheck pole sym |all (== Just sym) (pole !! 0) || all (== Just sym) (pole !! 1) || all (== Just sym) (pole !! 2) = True
				  |all (== Just sym) ([pole !! 0 !! 0, pole !! 1 !! 1, pole !! 2 !! 2]) || all (== Just sym) [pole !! 0 !! 2, pole !! 1 !! 1, pole !! 2 !! 0] = True
				  |otherwise = False
				   where
					   symbol = if sym == X
							    then O
							    else X
								
-- ФУНКЦИЯ ДЛЯ НИЧЬЕЙ


emptyCheck :: Pos -> Field -> Bool -- проверяет, пустая ли ячейка по заданной позиции
emptyCheck (x,y) field | field !! x !! y == Nothing = True
                       | otherwise = False

updateField :: Pos -> Field -> Symbol -> Maybe Field -- обновляет поле, помещая символ в указанную позицию, если она допустима и пустая.
updateField (x,y) field symbol | x > 3 || x < 0 || y > 3 || y < 0 || emptyCheck (x,y) field == False = Nothing
                               | otherwise =  Just (map (\(row,x') -> map (\(cell,y') -> if (x' == x && y' == y) then Just symbol else cell) (zip row [0..])) (zip field [0..]))


robotMove :: Field -> Pos --случайный ход робота, который выбирает пустую ячейку
robotMove field = do
    let move = (randomEl 3, randomEl 3)
    if emptyCheck move field == False
        then robotMove field
        else move 

gameCycle :: Field -> Symbol -> IO()
gameCycle field symbol = do
    printField field
    if winCheck field symbol == True
        then do
            if symbol == X
                then putStrLn ("Player O win!!!")
                else putStrLn ("Player X win!!!")
            putStrLn "Press any button to exit"
            n <- getLine
            putStrLn n
        else undefined



main :: IO () 
main = do
    gameCycle (initField) X