module DifferenceOfSquares exposing (difference, squareOfSum, sumOfSquares)


squareOfSum : Int -> Int
squareOfSum n =
    List.range 1 n
        |> List.foldl (+) 0
        |> square


sumOfSquares : Int -> Int
sumOfSquares n =
    List.range 1 n
        |> List.map square
        |> List.foldl (+) 0


difference : Int -> Int
difference n =
    squareOfSum n - sumOfSquares n


square : Int -> Int
square num =
    num * num
