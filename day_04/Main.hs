main :: IO ()
main = do
  let count1 =
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
              (z + y * 10 + x * 100 + c * 1000 + b * 10000 + a * 100000) > max,
              min > (z + y * 10 + x * 100 + c * 1000 + b * 10000 + a * 100000)
          ]
  let count2 =
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
              (z + y * 10 + x * 100 + c * 1000 + b * 10000 + a * 100000) > max,
              min > (z + y * 10 + x * 100 + c * 1000 + b * 10000 + a * 100000),
              not (a == b && b == c && x /= y && y /= z),
              not (b == c && c == x && y /= z),
              not (a /= b && c == x && x == y),
              not (a /= b && b /= c && x == y && y == z),
              not (a == b && b == c && x == y && y == z)
          ]
  putStrLn (show count1)
  putStrLn (show count2)
  where
    digit = [0 .. 9]
    min = 746315
    max = 248345
