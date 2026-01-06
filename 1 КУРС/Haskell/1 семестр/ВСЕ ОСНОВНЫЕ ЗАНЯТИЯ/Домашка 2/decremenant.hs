import Data.List

discr :: Float -> Float -> Float -> Float
x1 :: Float -> Float -> Float -> Float
x2 :: Float -> Float -> Float -> Float
solve :: Float -> Float -> Float -> [Float]

discr a b c = b**2 - 4*a*c
x1 a b c = let discr = b**2 - 4*a*c
		   in ((-b) + sqrt(discr)) / (2 * a) 
		   
x2 a b c = let discr =   b**2 - 4*a*c
		   in ((-b) - sqrt(discr)) / (2 * a) 

solve a b c 
		  | discr>0 = [x1 a b c, x2 a b c]
		  | discr == 0 =[x1 a b c]
		  | otherwise = [] 
		  where discr = b * b - 4 * a * c

main :: IO ()
main = do
  putStrLn "Test Cases:"
  putStrLn "a = 1, b = -8, c = 12"
  if solve 1 (-8) 12 == [6.0, 2.0]
    then putStrLn "Test 1 Passed"
    else putStrLn "Test 1 Failed"

  putStrLn "a = 1, b = -6, c = 9"
  if solve 1 (-6) 9 == [3.0]
    then putStrLn "Test 2 Passed"
    else putStrLn "Test 2 Failed"

  putStrLn "a = 5, b = 3, c = 7"
  if solve 5 3 7 == []
    then putStrLn "Test 3 Passed"
    else putStrLn "Test 3 Failed"

  putStrLn "a = 0, b = 4, c = -12"
  if solve 0 4 (-12) == [3.0]
    then putStrLn "Test 4 Passed"
    else putStrLn "Test 4 Failed"

  putStrLn "a = 0, b = 0, c = 7"
  if solve 0 0 7 == []
    then putStrLn "Test 5 Passed"
    else putStrLn "Test 5 Failed"


