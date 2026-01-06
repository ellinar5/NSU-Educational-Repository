f:: Float -> Float
f x 
  | cos (x) > 0 = logBase (cos x) (sin (x))
  | otherwise = error "Error!"

--Без условия, если число больше 1, выводит отрицательные числа (NaN)