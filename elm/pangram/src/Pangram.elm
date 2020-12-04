module Pangram exposing (isPangram)

import Regex


alphabet : String
alphabet =
    "abcdefghijklmnopqrstuvwxyz"


isInAlphabet : String -> Bool
isInAlphabet string =
    alphabet
        |> String.contains string


letter : Regex.Regex
letter =
    Maybe.withDefault Regex.never <|
        Regex.fromString "[a-z]"


isPangram : String -> Bool
isPangram sentence =
    let
        stringList =
            sentence
                |> String.toLower
                |> String.split ""
                |> List.filter (\s -> Regex.contains letter s)

        finalCount = List.filter(\s -> List.member s stringList) (String.split "" alphabet) |> Debug.log "final count"
    in
    case List.head stringList of
        Nothing ->
            False

        Just _ ->
            if List.length finalCount < 26 then
                False
            else
                True
