-- №1Реализуйте функцию, которая ищет в строке первое вхождение
--символа, который является цифрой, и возвращает Nothing, если в
--строке нет цифр.

-- Суть: берем строку, находим чиселку
-- чиселка типа String -> преобразование в Int
-- Вывод

-- digitToInt - преобразование в Int

import Data.Char (isDigit, digitToInt)

stroca :: String -> Maybe Int
stroca [] = Nothing -- если пустая строка
stroca (x:xs)
    | isDigit x = Just (digitToInt x) -- Преобразуем Char в Int
    | otherwise = stroca xs -- Продолжаем искать в оставшейся строке

-- №2 Maybe можно рассматривать как простой контейнер, например, как
--список длины 0 или 1. Реализуйте функцию maybeToList,
--преобразующие Maybe a в [a]

-- Суть: 1) передать  Maybe a -> [a]
-- 2)Работа с Nothing: если у нас ничего -> пустой список 
-- 3)Работа с Just: если что-то есть -> список типа а

import Data.Char (isDigit)
maybeToList ::  Maybe a -> [a]
maybeToList  Nothing = []
maybeToList (Just x) = [x]

-- №3 Напишите функции для получения головы и хвоста списка. В случае,
-- если список пустой они возвращают Nothing, иначе – Just ответ.
import Data.Char (isDigit)
myHead :: [a] -> Maybe a
myHead [] = Nothing
myHead (x:_) = Just x

myTail :: [a] -> Maybe [a]
myTail [] = Nothing
myTail (_:xs) = Just xs 
