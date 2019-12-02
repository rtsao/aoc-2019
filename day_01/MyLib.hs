module MyLib
  ( fuelCost,
    fuelCost',
  )
where

fuelCost :: Integer -> Integer
fuelCost mass = (quot mass 3) - 2

fuelCost' :: Integer -> Integer
fuelCost' mass
  | fuelMass > 0 = fuelMass + fuelCost' fuelMass
  | otherwise = 0
  where
    fuelMass = fuelCost mass
