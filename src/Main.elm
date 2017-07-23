module Main exposing (..)

import Navigation exposing (Location, program)

import Model exposing (Model, initialModel)
import Msg exposing (Msg (UrlChange))
import Update exposing (update)
import View exposing (view)


main : Program Never Model Msg
main =
    program UrlChange
        { init = init
        , subscriptions = subscriptions
        , update = update
        , view = view
        }

init : Location -> (Model, Cmd Msg)
init location =

    update (UrlChange location) initialModel


-- Not actually using this, here just in case
subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch []