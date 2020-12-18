module Leap exposing (isLeapYear)


isLeapYear : Int -> Bool
isLeapYear year =
    let
        divisibleByFour : Bool
        divisibleByFour =
            year |> modBy 4 |> (==) 0

        divisibleByOneHundred : Bool
        divisibleByOneHundred =
            year |> modBy 100 |> (==) 0

        divisibleByFourHundred : Bool
        divisibleByFourHundred =
            year |> modBy 400 |> (==) 0
    in
    case ( divisibleByFour, divisibleByOneHundred, divisibleByFourHundred ) of
        ( True, True, True ) ->
            True

        ( True, False, False ) ->
            True

        _ ->
            False
