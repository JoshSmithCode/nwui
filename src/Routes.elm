module Routes exposing (Route (..), encode, decode, navigate)

import UrlParser exposing (Parser, oneOf, s, string, (</>))
import Navigation exposing (Location)


type Route
    = NotFound
    | Home
    | QuickNote


routeParser : Parser (Route -> a) a
routeParser =

    UrlParser.oneOf
        [ UrlParser.map Home (s "")
        , UrlParser.map QuickNote (s "quick-note")
        ]


encode : Route -> String
encode route =

    case route of

        NotFound ->
            "/404"

        Home ->
            "/"

        QuickNote ->
            "/quick-note"


decode : Location -> Maybe Route
decode location =

    UrlParser.parsePath routeParser location


navigate : Route -> Cmd msg
navigate route =

    Navigation.newUrl (encode route)
