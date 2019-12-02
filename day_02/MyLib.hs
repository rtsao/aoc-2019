module MyLib (execute) where

import Data.Foldable (toList)
import qualified Data.Sequence as Seq

execute :: [Int] -> [Int]
execute program = toList (execute' 0 (Seq.fromList program))

execute' :: Int -> Seq.Seq Int -> Seq.Seq Int
execute' pointer program = do
  case instruction of
    [1, a1, a2, target] -> execute' (pointer + 4) (set target (get a1 + get a2))
    [2, a1, a2, target] -> execute' (pointer + 4) (set target (get a1 * get a2))
    99 : _ -> program
  where
    instruction = toList (Seq.take 4 (Seq.drop pointer program))
    get a = Seq.index program a
    set a val = Seq.update a val program
