module Pages.QuickNote.View exposing (quickNoteView)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

import Entities exposing (Note)
import Msg exposing (Msg)

import Pages.QuickNote.Model exposing (QuickNoteModel)
import Pages.QuickNote.Msg exposing (..)


quickNoteView : QuickNoteModel -> Html Msg
quickNoteView model =

    let
      disableSave = (String.isEmpty model.noteTitle) || (String.isEmpty model.noteBody)

    in
        div
            [ class "row" ]
            [ div
                [ class "col-md-6" ]
                [ div
                    [ class "card" ]
                    [ div
                        [ class "card-header" ]
                        [ text "QuickNote" ]
                    , div
                        [ class "card-block" ]
                        [ div
                            [ class "form-group" ]
                            [ label
                                []
                                [ text "Note Title" ]
                            , input
                                [ type_ "text"
                                , class "form-control"
                                , value model.noteTitle
                                , onInput (Msg.QuickNoteMsg << UpdateNoteTitle)
                                ]
                                []
                            ]
                        , div
                            [ class "form-group" ]
                            [ label
                                []
                                [ text "Note Body" ]
                            , textarea
                                [ class "form-control"
                                , value model.noteBody
                                , onInput (Msg.QuickNoteMsg << UpdateNoteBody)
                                ]
                                []
                            ]
                        , button
                            [ class "btn btn-success float-right"
                            , onClick (Msg.QuickNoteMsg <| AddNote)
                            , disabled disableSave
                            ]
                            [ text "Save Note" ]
                        ]
                    ]
                ]
            , div
                [ class "col-md-6" ]
                [ div
                    [ class "card" ]
                    [ div
                        [ class "card-header" ]
                        [ text "Notes" ]
                    , div
                        [ class "list-group" ]
                        (List.map renderNote model.notes)
                    ]
                ]
            ]


renderNote : Note -> Html Msg
renderNote note =

    div
        [ class "list-group-item flex-column align-items-start" ]
        [ p
            []
            [ strong
                []
                [ text note.title ]
            ]
        , p
            []
            [ text note.body ]
        ]