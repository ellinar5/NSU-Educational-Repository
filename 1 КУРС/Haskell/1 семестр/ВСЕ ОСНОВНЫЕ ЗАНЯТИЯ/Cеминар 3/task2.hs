fizzBuzz :: Int -> String

fizzBuzz x 
         | x `mod` 3==0 = "fizz"
		 | x `mod` 5==0 = "Buzz"
		 | (x `mod` 3==0) && (x `mod` 5==0) = "fizzBuzz"
		 | otherwise = " "