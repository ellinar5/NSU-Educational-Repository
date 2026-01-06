-- Определите представителя класса Functor (ДОПИСАТЬ MAIN)
data Point3D a = Point3D a a a
    deriving Show

instance Functor Point3D where
    fmap f (Point3D x y z) = Point3D (f x) (f y) (f z)
	
-- Используйте <$>, чтобы инвертировать значение Maybe String
-- В КОМАНДНОЙ СТРОКЕ: reverse <$> Just "abc"

-- оператор <*>
-- maybeInc :: Maybe (Integer -> Integer)
-- maybelnc = (+) <$> Just 

-- Приведите строку "Hello World" к типу IO String
helloWorld :: IO String
helloWorld = pure "Hello World"

main :: IO ()
main = do
    str <- helloWorld  -- Извлечение строки из IO
    putStrLn str      -- Вывод строки на экран

-- Напишите универсальную версию fmap под названием allFmaps

allFmap :: Applicative f => (a -> b) -> f a -> f b
allFmap f x = pure f <*> x
-- allFmap func app = (pure f) <*> app

-- ПРОВЕРКА

-- Предположим, у нас есть функция для получения имени пользователя по его ID
lookupUserName :: String -> Maybe String
lookupUserName id = lookup id userDatabase  -- userDatabase - это ассоциативный список

userDatabase :: [(String, String)]
userDatabase = [("1", "Alice"), ("2", "Bob"), ("3", "Charlie")]

-- Функция, получающая кредиты пользователя по ID
getCredits :: String -> Maybe String
getCredits id = pure lookup <*> lookupUserName id <*> pure creditsDatabase
  where
    creditsDatabase = [("Alice", "100"), ("Bob", "200"), ("Charlie", "300")]