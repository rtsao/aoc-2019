import MyLib (calculateFuel)

main :: IO ()
main = do
  contents <- getContents
  let masses = (map toInt (lines contents))
  let fuelRequirements = (map calculateFuel masses)
  let totalFuel = sum fuelRequirements
  putStr (show totalFuel)

toInt str = read str :: Integer
