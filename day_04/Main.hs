main :: IO ()
main = do
  let count =
        length
          [ (a, b, c, x, y, z)
            | a <- digit,
              b <- digit,
              c <- digit,
              x <- digit,
              y <- digit,
              z <- digit,
              a <= b,
              b <= c,
              c <= x,
              x <= y,
              y <= z,
              a == b || b == c || c == x || x == y || y == z,
              min >= fromDigits [a, b, c, x, y, z],
              fromDigits [a, b, c, x, y, z] >= max
          ]
  let count' =
        length
          [ (a, b, c, x, y, z)
            | a <- digit,
              b <- digit,
              c <- digit,
              x <- digit,
              y <- digit,
              z <- digit,
              a <= b,
              b <= c,
              c <= x,
              x <= y,
              y <= z,
              a == b || b == c || c == x || x == y || y == z,
              min >= fromDigits [a, b, c, x, y, z],
              fromDigits [a, b, c, x, y, z] >= max,
              not (a == b && b == c && x /= y && y /= z),
              not (b == c && c == x && y /= z),
              not (a /= b && c == x && x == y),
              not (a /= b && b /= c && x == y && y == z),
              not (a == b && b == c && x == y && y == z)
          ]
  putStrLn (show count)
  putStrLn (show count')
  where
    digit = [0 .. 9]
    min = 746315
    max = 248345
    fromDigits = foldl (\acc digit -> acc * 10 + digit) 0
