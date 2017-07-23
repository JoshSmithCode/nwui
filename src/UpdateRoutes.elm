module UpdateRoutes exposing (updateRoute, urlChange, routeChange)

import Navigation exposing (Location)

import Model exposing (Model)
import Msg exposing (Msg)
import Routes exposing (Route (..), encode, decode, navigate)
import Types exposing (PageState (..), Page (..))

import Pages.Home.Model exposing (initialHomeModel)
import Pages.QuickNote.Model exposing (initialQuickNoteModel)


urlChange : Location -> Model -> (Model, Cmd Msg)
urlChange location model =

    let
        route = decode location

    in
        updateRoute route model


routeChange : Route -> Model -> (Model, Cmd Msg)
routeChange route model =

    let
        (newModel, cmd) =
            updateRoute (Just route) model

    in
        newModel ! [navigate route, cmd]


updateRoute : Maybe Route -> Model -> (Model, Cmd Msg)
updateRoute route model =

    case route of

        Nothing ->
            { model
                | route = NotFound
                , page =  NoPage
            } ! []

        Just NotFound ->
            { model
                | route = NotFound
                , page = NoPage
            } ! []

        Just Home ->
            { model
                | route = Home
                , page = Loaded <| HomePage initialHomeModel
            } ! []

        Just QuickNote ->
            { model
                | route = QuickNote
                , page = Loaded <| QuickNotePage initialQuickNoteModel
            } ! []