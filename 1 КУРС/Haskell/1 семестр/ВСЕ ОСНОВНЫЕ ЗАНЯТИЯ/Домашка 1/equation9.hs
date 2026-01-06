root :: Float -> Float -> Float
root base degree = base ** (1 / degree) 

f :: Float -> Float
f x 
  | (1 + x**3) / (1 - x**3) > 0 = root ( (1 + x**3) / (1 - x**3)) 3
  | otherwise = error "Error!"
