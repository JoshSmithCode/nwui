module Update exposing (update)

import Model exposing (Model)
import Msg exposing (Msg (..))
import UpdateRoutes exposing (urlChange, routeChange)
import Types exposing (PageState (..), Page (..))

import Pages.QuickNote.Msg exposing (QuickNoteMsg)
import Pages.QuickNote.Update exposing (quickNoteUpdate)


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =

    case (msg, model.page) of

        (UrlChange location, _) ->
            urlChange location model

        (Navigate route, _) ->
            routeChange route model

        (QuickNoteMsg msg, Loaded (QuickNotePage pageModel)) ->
            { model
            | page = Loaded <| QuickNotePage <| quickNoteUpdate msg pageModel
            } ! []



        _ ->
            model ! []
