module View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)

import Model exposing (Model)
import Msg exposing (Msg)
import Types exposing (PageState (..), Page (..))

import Pages.QuickNote.View exposing (quickNoteView)


view : Model -> Html Msg
view model =

    div
        [ class "container" ]
        [ h1
            []
            [ text "Noteworthy" ]
        , div
            [ class "page-content" ]
            [ renderPageState model ]
        ]


renderPageState : Model -> Html Msg
renderPageState model =

    case model.page of

        NoPage ->

            p
                []
                [ text "Page not found!" ]

        Loading ->

            p
                []
                [ text "Loading..." ]

        Loaded page ->

            renderPage page

        Error page ->

            p
                []
                [ text "ERROR!!!" ]


renderPage : Page -> Html Msg
renderPage page =

    case page of

        HomePage model ->

            p
                []
                [ text "This is the home page...You shouldn't be here..." ]

        QuickNotePage model ->

            quickNoteView model




