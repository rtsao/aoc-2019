import MyLib (execute)
import Test.Tasty
import Test.Tasty.HUnit

main = defaultMain tests

tests :: TestTree
tests =
  testGroup
    "Tests"
    [ testCase "Sample programs" $ do
        execute [1, 0, 0, 0, 99] @?= [2, 0, 0, 0, 99]
        execute [2, 3, 0, 3, 99] @?= [2, 3, 0, 6, 99]
        execute [2, 4, 4, 5, 99, 0] @?= [2, 4, 4, 5, 99, 9801]
        execute [1, 1, 1, 4, 99, 5, 6, 0, 99] @?= [30, 1, 1, 4, 2, 5, 6, 0, 99]
    ]
