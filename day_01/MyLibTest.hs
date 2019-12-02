import MyLib
  ( getFuelRequirement,
  )
import Test.Tasty
import Test.Tasty.HUnit

main = defaultMain $ testCase "Fuel requirements" $ do
  getFuelRequirement (12) @?= 2
  getFuelRequirement (14) @?= 2
  getFuelRequirement (1969) @?= 654
  getFuelRequirement (100756) @?= 33583
