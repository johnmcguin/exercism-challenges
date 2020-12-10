module Hamming exposing (distance)

import Result


distance : String -> String -> Result String Int
distance left right =
    let
        eq =
            String.length left == String.length right
    in
    if eq then
        List.map2 Tuple.pair (String.split "" left) (String.split "" right)
            |> List.filter (\t -> Tuple.first t /= Tuple.second t)
            |> List.length
            |> Result.Ok

    else
        Result.Err "left and right strands must be of equal length"
