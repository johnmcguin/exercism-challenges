module TwoFer exposing (twoFer)



twoFer : Maybe String -> String
twoFer name =
    case name of
       Just theName -> "One for " ++ theName ++ ", one for me."
       Nothing -> "One for you, one for me."
