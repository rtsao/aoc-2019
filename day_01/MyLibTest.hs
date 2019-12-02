import MyLib
  ( fuelCost,
    fuelCost',
  )
import Test.Tasty
import Test.Tasty.HUnit

main = defaultMain tests

tests :: TestTree
tests =
  testGroup
    "Tests"
    [ testCase "Fuel requirements" $ do
        fuelCost 12 @?= 2
        fuelCost 14 @?= 2
        fuelCost 1969 @?= 654
        fuelCost 100756 @?= 33583,
      testCase "Fuel requirements including fuel" $ do
        fuelCost' 14 @?= 2
        fuelCost' 1969 @?= 966
        fuelCost' 100756 @?= 50346
    ]
