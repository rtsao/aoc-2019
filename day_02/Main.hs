import qualified Data.Foldable as Foldable
import qualified Data.List as List
import Data.List.Split (splitOn)
import qualified Data.Sequence as Seq
import MyLib (execute)

main :: IO ()
main = do
  contents <- getContents
  let program = map read (splitOn "," contents)
  putStr (findInputs program)

findInputs program = do
  let result = List.find (\(a, b) -> (executeWithArgs a b program) == 19690720) [(x, y) | x <- [0 .. 99], y <- [0 .. 99]]
  case result of
    Nothing -> "Not found"
    Just val@((noun, verb)) -> "Found noun=" ++ (show noun) ++ " verb=" ++ (show verb) ++ " Answer: " ++ (show (100 * noun + verb))

executeWithArgs noun verb program = do
  let seq = Seq.fromList program
  let changed = Foldable.toList (Seq.update 2 verb (Seq.update 1 noun seq))
  head (execute changed)
