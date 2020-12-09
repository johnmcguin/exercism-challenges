module PhoneNumber exposing (getNumber)


getNumber : String -> Maybe String
getNumber phoneNumber =
    let
        normalized =
            phoneNumber
                |> String.filter Char.isDigit

        hasCountryCode =
            normalized
                |> String.left 1
                |> (==) "1"

        formatted =
            if hasCountryCode then
                normalized |> String.dropLeft 1

            else
                normalized

        ( zeroPlaces, onesPlaces ) =
            ( String.indexes "0" formatted, String.indexes "1" formatted )

        isTen =
            String.length formatted == 10
    in
    if isTen && List.any invalidZerosPlaces zeroPlaces == False && List.any invalidOnesPlaces onesPlaces == False then
        Just formatted

    else
        Nothing


invalidZerosPlaces : Int -> Bool
invalidZerosPlaces num =
    num == 0 || num == 1 || num == 3


invalidOnesPlaces : Int -> Bool
invalidOnesPlaces num =
    num == 3 || num == 0
