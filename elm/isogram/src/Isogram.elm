module Isogram exposing (isIsogram)
import Set exposing (Set)

isIsogram : String -> Bool
isIsogram sentence =    
    let
        list = sentenceToNormalizedList sentence
        set = normalizedSentenceAsSet list
    in
        if List.length list == Set.size set then
            True
        else
            False
    

sentenceToNormalizedList : String -> List Char
sentenceToNormalizedList sentence =
    sentence
        |> String.toLower
        |> String.toList
        |> List.filter Char.isAlpha

normalizedSentenceAsSet : List Char -> Set Char
normalizedSentenceAsSet sentence =
    sentence
        |> Set.fromList
