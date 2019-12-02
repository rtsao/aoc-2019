module MyLib
  ( execute,
  )
where

import qualified Data.Foldable as Foldable
import qualified Data.Sequence as Seq

execute :: [Int] -> [Int]
execute program = Foldable.toList (execute' 0 (Seq.fromList program))

execute' :: Int -> Seq.Seq Int -> Seq.Seq Int
execute' pointer program = do
  case Foldable.toList (Seq.take 4 (Seq.drop pointer program)) of
    [1, ai, bi, target] -> execute' (pointer + 4) (Seq.update target ((Seq.index program ai) + (Seq.index program bi)) program)
    [2, ai, bi, target] -> execute' (pointer + 4) (Seq.update target ((Seq.index program ai) * (Seq.index program bi)) program)
    [99] -> program
    [99, _] -> program
    [99, _, _] -> program
    [99, _, _, _] -> program
