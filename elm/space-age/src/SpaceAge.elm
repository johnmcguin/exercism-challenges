module SpaceAge exposing (Planet(..), ageOn)


type Planet
    = Mercury
    | Venus
    | Earth
    | Mars
    | Jupiter
    | Saturn
    | Uranus
    | Neptune


orbitalPeriods : List ( Planet, Float )
orbitalPeriods =
    [ ( Mercury, 0.2408467 )
    , ( Venus, 0.61519726 )
    , ( Earth, 1.0 )
    , ( Mars, 1.8808158 )
    , ( Jupiter, 11.862615 )
    , ( Saturn, 29.447498 )
    , ( Uranus, 84.016846 )
    , ( Neptune, 164.79132 )
    ]


ageOn : Planet -> Float -> Float
ageOn planet seconds =
    orbitalPeriods
        |> List.filter (\obitalPeriod -> Tuple.first obitalPeriod == planet)
        |> List.head
        |> (\maybePair ->
                case maybePair of
                    Just pair ->
                        pair
                            |> Tuple.second
                            |> (*) 31557600
                            |> (\planetSeconds -> seconds / planetSeconds)

                    Nothing ->
                        0
           )