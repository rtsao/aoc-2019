import MyLib (fuelCost')

main :: IO ()
main = do
  contents <- getContents
  let masses = map read (lines contents)
  let fuelRequirements = map fuelCost' masses
  let totalFuel = sum fuelRequirements
  putStr (show totalFuel)
