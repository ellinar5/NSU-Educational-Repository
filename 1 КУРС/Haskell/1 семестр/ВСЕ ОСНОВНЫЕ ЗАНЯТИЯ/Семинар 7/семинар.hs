import Data.Maybe
-- 1 подается строка,  в ней программа должна гайти int число => вывести 1 попавшие число

-- fun :: String -> Maybe Int
-- fun "" = Nothing
-- fun (s:str) | isDigit s == True = Just (digtToInt s)
			-- | otherwise = fun str
			
-- 2 Maybe -простой контейнер (длина 0 или 1). Рефзизовать функцию maybeToList преобразовая Maybe a в [a]

maybeToList :: Maybe a -> [a]
maybeToList Nothing = []
maybeToList (Just x) = [fromJust x]