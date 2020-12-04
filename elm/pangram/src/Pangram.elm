module Pangram exposing (isPangram)

import Regex


alphabet : List String
alphabet =
    String.split "" "abcdefghijklmnopqrstuvwxyz"


letter : Regex.Regex
letter =
    Maybe.withDefault Regex.never <|
        Regex.fromString "[a-z]"


isPangram : String -> Bool
isPangram sentence =
    let
        sentenceAsList =
            sentence
                |> String.toLower
                |> String.split ""
                |> List.filter (\s -> Regex.contains letter s)

        lettersInAlphabet =
            alphabet
                |> List.filter(\s -> List.member s sentenceAsList)

    in
        if List.length lettersInAlphabet < 26 then
            False
        else
            True
