import Data.List 
import System.IO

-- Функция сжатия с учетом отдельных символов
rleCompress :: String -> [(Int, Char)]
rleCompress [] = []
rleCompress (x:xs) = (count, x) : rleCompress rest
  where
    (count, rest) = countChar x xs
    countChar c [] = (1, []) -- Если строка закончилась, возвращаем 1 и пустую строку
    countChar c (y:ys)
      | c == y    = let (cnt, r) = countChar c ys in (cnt + 1, r)
      | otherwise = (1, y:ys) -- Если символ отличается, возвращаем 1 и оставшуюся строк

-- Функция для чтения содержимого файла
readFileContent :: FilePath -> IO String
readFileContent filePath = do
    content <- readFile filePath
    return content

-- Функция для обработки файлов (только сжатие)
processFile :: FilePath -> IO ()
processFile file = do
    content <- readFileContent file
    let result = rleCompress content
    writeFile ("output_" ++ file) (show result) -- Преобразуем результат в строку для записи в файл

main :: IO ()
main = do
    putStrLn "Выберите формат файла: 1 - .txt; 2 - .html; 3 - .css; 4 - .hs"
    formatChoice <- getLine
    let fileExtension = case formatChoice of
            "1" -> "txt"
            "2" -> "html"
            "3" -> "css"
            "4" -> "hs"
            _   -> error "Неверный выбор формата"

    putStrLn $ "Введите имя файла с расширением ." ++ fileExtension ++ ":"
    filePath <- getLine
    processFile (filePath ++ "." ++ fileExtension)
    putStrLn $ "Файл обработан. Результат сохранён в output_" ++ filePath ++ "." ++ fileExtension