-- №1 программа где надо угадать число где она уже указана

--Суть:
-- 
main :: IO ()
main = do
    let password = "2390"
    putStrLn "Угадайте пароль (четырехзначное число): "
    guessLoop password

parol :: String -> IO ()
guessLoop password = do
    guess <- getLine
    if guess == password then do
        putStrLn "Вы угадали пароль!"
        else do
        putStrLn "Неправильный пароль, попробуйте снова."
        guessLoop password 


--[[x,y,z,w]|x<-['0'..'9'],y<-['0'..'9'],z<-['0'..'9'],w<-['0'..'9'],x/=y,y/=z,z/=w]
