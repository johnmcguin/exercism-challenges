module Leap exposing (isLeapYear)


isLeapYear : Int -> Bool
isLeapYear year =
    case ( divisibleBy year 4, divisibleBy year 100, divisibleBy year 400 ) of
        ( True, True, True ) ->
            True

        ( True, False, False ) ->
            True

        _ ->
            False


divisibleBy : Int -> Int -> Bool
divisibleBy year num =
    year |> modBy num |> (==) 0
