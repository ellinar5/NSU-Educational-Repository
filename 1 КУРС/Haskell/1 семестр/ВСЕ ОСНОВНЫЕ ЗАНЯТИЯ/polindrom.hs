import Data.Char (toLower, isAlpha)

palindrom :: [Char] -> Bool
palindrom s =
    norm == reverse norm
    where norm = map toLower $ filter isAlpha $ s

test :: [Char] -> IO ()
test s =
    putStrLn $ s ++ ": " ++ show (palindrom s)

main = do
    test "А в Енисее — синева"
    test "А роза упала на лапу Азора"
    test "Не роза упала на лапу Азора"
    test "Мир как Рим"
    test "Мир не Рим"
    test "I prefer Pi"
    test "حوت فمه مفتوح"
    test "Ne mateno, bone tamen"

-- Вывод:
-- А в Енисее — синева: True
-- А роза упала на лапу Азора: True
-- Не роза упала на лапу Азора: False
-- Мир как Рим: True
-- Мир не Рим: False
-- I prefer Pi: True
-- حوت فمه مفتوح: True
-- Ne mateno, bone tamen: True