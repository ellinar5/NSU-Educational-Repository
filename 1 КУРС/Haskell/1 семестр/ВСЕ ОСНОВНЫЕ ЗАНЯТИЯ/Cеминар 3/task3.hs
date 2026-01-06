square :: Int -> Int
double :: Int -> Int
inc :: Int -> Int
squareD :: Int -> Int
 
square x = x ^ 2
double x = x * 2
inc x = x + 1

squareD = inc.double.square
