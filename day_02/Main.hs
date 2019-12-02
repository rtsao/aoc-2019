import Data.Foldable (toList)
import qualified Data.List as List
import Data.List.Split (splitOn)
import qualified Data.Sequence as Seq
import MyLib (execute)

main :: IO ()
main = do
  contents <- getContents
  let program = map read (splitOn "," contents)
  putStr (findInputs program)

findInputs :: [Int] -> String
findInputs program =
  case List.find matchesOutput inputs of
    Nothing -> "Not found"
    Just (noun, verb) ->
      "Found noun=" ++ (show noun) ++ " verb=" ++ (show verb)
        ++ " Answer: "
        ++ (show (100 * noun + verb))
  where
    inputs = [(noun, verb) | noun <- [0 .. 99], verb <- [0 .. 99]]
    matchesOutput (noun, verb) = executeWithArgs noun verb program == 19690720

executeWithArgs :: Int -> Int -> [Int] -> Int
executeWithArgs noun verb program = do
  let seq = Seq.fromList program
  let changed = toList (Seq.update 2 verb (Seq.update 1 noun seq))
  head (execute changed)
