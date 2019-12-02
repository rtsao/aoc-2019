import MyLib (calculateFuel)

main :: IO ()
main = do
  contents <- getContents
  let masses = map read (lines contents)
  let fuelRequirements = map calculateFuel masses
  let totalFuel = sum fuelRequirements
  putStr (show totalFuel)
