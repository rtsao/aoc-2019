module MyLib (findNearestIntersection, findShortestIntersection) where

import qualified Data.List as List
import Data.List.Split (splitOn)
import qualified Data.Map as Map
import Data.Maybe (fromJust)
import qualified Data.Set as Set
import Prelude hiding (Left, Right)

data Dir = Up | Right | Down | Left deriving (Show, Eq, Ord)

type Point = (Int, Int)

type Segment = (Dir, Int)

type Path = [Segment]

findNearestIntersection :: String -> Int
findNearestIntersection input = do
  let paths = parseInput input
  let wires = map rasterizePath paths
  let wires_sets = map Set.fromList (map tail wires)
  let intersections = foldl1 Set.intersection wires_sets
  let distances = map (distance origin) (Set.toList intersections)
  List.minimum distances
  where
    origin = (0, 0)

findShortestIntersection :: String -> Int
findShortestIntersection input = do
  let paths = parseInput input
  let wires = map rasterizePath paths
  let wires_sets = (map Set.fromList (map tail wires))
  let intersections = foldl1 Set.intersection wires_sets
  let distance_indexes = map (\wire -> Map.fromList (zipWith (\i p -> (p, i)) [0 ..] wire)) wires
  let distances = map (distance distance_indexes) (Set.toList intersections)
  List.minimum distances
  where
    origin = (0, 0)
    distance indexes p = sum (map (\m -> fromJust (Map.lookup p m)) indexes)

rasterizePath :: Path -> [Point]
rasterizePath segments =
  foldl
    (\acc segment -> (init acc) ++ (rasterizeSegment (last acc) segment))
    [origin]
    segments
  where
    origin = (0, 0)

rasterizeSegment :: Point -> Segment -> [Point]
rasterizeSegment origin@(x, y) segment@(dir, dist) =
  case dir of
    Up -> [(x, y) | x <- [x], y <- [y .. y + dist]]
    Down -> [(x, y) | x <- [x], y <- [y, y -1 .. y - dist]]
    Right -> [(x, y) | x <- [x .. x + dist], y <- [y]]
    Left -> [(x, y) | x <- [x, x - 1 .. x - dist], y <- [y]]

parseInput :: String -> [Path]
parseInput str = map parsePath (lines str)

parsePath :: String -> Path
parsePath str = map parseSegment (splitOn "," str)

parseSegment :: String -> Segment
parseSegment (dir_char : dist_str) = (direction, distance)
  where
    distance = read dist_str
    direction = case dir_char of
      'R' -> Right
      'L' -> Left
      'U' -> Up
      'D' -> Down

distance :: (Int, Int) -> (Int, Int) -> Int
distance (x1, y1) (x2, y2) = abs (x2 - x1) + abs (y2 - y1)
