--Учитывая строку, представляющую последовательность ДНК,
--подсчитайте, сколько присутствует каждого нуклеотида. Если
--строка содержит символы, отличные от A, C, G или T, то она
--недействительна, и Вам следует сообщить об ошибке. 

--Структура данных: data Nucleotide = A | C | G | T

--Для проверки: "GATTACA"  ------------- [('A', 3), ('C', 1), ( 'G', 1), ( 'T', 2)] 
--"INVALID" ---------------- error

--data Either a b = Left a | Right b deriving (...) 

import Data.List
data Nucleotide =  A | C | G | T deriving(Show,Eq)
podchetNucleotide :: String -> Either String [(Char,Int)]
-- podchetNucleotide "" = Left "error" -- если ничего нет

nedopusk :: String -> Bool
nedopusk str = any (`notElem` "ACGT") str

podchetNucleotide str
	| null str = Left "error" -- если строка пустая
	| nedopusk str = Left "error" --если не совпадают
	| otherwise = Right [(c, length $ filter (== c) str) | c <- "ACGT"] -- если совпадают