module MyLib
  ( getFuelRequirement,
  )
where

getFuelRequirement :: Integer -> Integer
getFuelRequirement mass = (quot mass 3) - 2
