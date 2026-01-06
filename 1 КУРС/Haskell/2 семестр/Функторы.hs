data List a = Empty | Value a (List a) deriving (Show)

-- 1. Сделать список функтором 
instance Functor List where
    fmap _ Empty = Empty 
    fmap f (Value x xs) = Value (f x) (fmap f xs)  -- Применяем f к каждому элементу списка
	
main :: IO ()
main = do
    let example = Value 1 (Value 2 (Value 3 Empty))
    print $ fmap (*2) example
	
-- 2. Напишите функцию, которая добавляет один список в другой
lists:: List a -> List a -> List a
lists  Empty ys = ys -- Если 1 список пуст возвращаем 2 список
lists (Value x xs) ys = Value x (lists xs ys)

main1 :: IO()
main1 = do
    let roster1 =  Value 1 (Value 2 (Value 3 Empty))
    let roster2 =  Value 2 (Value 3 (Value 4 Empty))
    let combined = lists roster1 roster2
    print combined
	
-- 3. Сделайте наш список моноидом 
instance Monoid


