import MyLib (findNearestIntersection, findShortestIntersection)

main :: IO ()
main = do
  contents <- getContents
  let nearest = findNearestIntersection contents
  putStrLn ("Nearest: " ++ show nearest)
  let shortest = findShortestIntersection contents
  putStrLn ("Shortest: " ++ show shortest)
