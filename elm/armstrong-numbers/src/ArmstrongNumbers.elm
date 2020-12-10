module ArmstrongNumbers exposing (isArmstrongNumber)


isArmstrongNumber : Int -> Bool
isArmstrongNumber numb =
    let
        str =
            String.fromInt numb

        list =
            String.toList str

        len =
            List.length list
    in
    list
        |> List.filter Char.isDigit
        |> List.map (\char -> charsToSquares char len)
        |> List.sum
        |> (==) numb


charsToSquares : Char -> Int -> Int
charsToSquares char len =
    case String.toInt (String.fromChar char) of
        Just n ->
            n ^ len

        Nothing ->
            0 ^ len
