module MyLib
  ( getFuelRequirement,
    calculateFuel,
  )
where

getFuelRequirement :: Integer -> Integer
getFuelRequirement mass = (quot mass 3) - 2

calculateFuel :: Integer -> Integer
calculateFuel mass = do
  let fuelRequirement = getFuelRequirement (mass)
  if fuelRequirement > 0
    then fuelRequirement + calculateFuel (fuelRequirement)
    else 0
