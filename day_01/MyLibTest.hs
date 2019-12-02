import MyLib
  ( calculateFuel,
    getFuelRequirement,
  )
import Test.Tasty
import Test.Tasty.HUnit

main = defaultMain tests

tests :: TestTree
tests =
  testGroup
    "Tests"
    [ testCase "Fuel requirements" $ do
        getFuelRequirement 12 @?= 2
        getFuelRequirement 14 @?= 2
        getFuelRequirement 1969 @?= 654
        getFuelRequirement 100756 @?= 33583,
      testCase "Fuel requirements including fuel" $ do
        calculateFuel 14 @?= 2
        calculateFuel 1969 @?= 966
        calculateFuel 100756 @?= 50346
    ]
