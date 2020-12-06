module Bob exposing (hey)


type Statement
    = PlainYell
    | Ask
    | YellAsk
    | Silence
    | Default


hey : String -> String
hey remark =
    case determineStatement remark of
        Ask ->
            "Sure."

        PlainYell ->
            "Whoa, chill out!"

        YellAsk ->
            "Calm down, I know what I'm doing!"

        Silence ->
            "Fine. Be that way!"

        Default ->
            "Whatever."


determineStatement : String -> Statement
determineStatement string =
    let
        trimmed =
            String.trim string

        yell =
            isYell trimmed

        ask =
            isAsk trimmed

        yellAsk =
            isYell trimmed && isAsk trimmed

        isEmpty =
            String.isEmpty trimmed
    in
    if yellAsk == True then
        YellAsk

    else if yell == True then
        PlainYell

    else if ask == True then
        Ask

    else if isEmpty == True then
        Silence

    else
        Default


isYell : String -> Bool
isYell string =
    let
        filtered =
            string |> String.filter Char.isAlpha
    in
    if String.isEmpty filtered then
        False

    else
        filtered |> String.all Char.isUpper


isAsk : String -> Bool
isAsk string =
    string
        |> String.right 1
        |> (==) "?"
