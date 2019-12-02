import MyLib (getFuelRequirement)

main :: IO ()
main = do
  contents <- getContents
  let masses = (map toInt (lines contents))
  let fuelRequirements = (map getFuelRequirement masses)
  let totalFuel = sum fuelRequirements
  putStr (show totalFuel)

toInt str = read str :: Integer
