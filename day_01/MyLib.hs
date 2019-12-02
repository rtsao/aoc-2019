module MyLib
  ( getFuelRequirement,
    calculateFuel,
  )
where

getFuelRequirement :: Integer -> Integer
getFuelRequirement mass = (quot mass 3) - 2

calculateFuel :: Integer -> Integer
calculateFuel mass
  | fuelRequirement > 0 = fuelRequirement + calculateFuel fuelRequirement
  | otherwise = 0
  where
    fuelRequirement = getFuelRequirement mass
