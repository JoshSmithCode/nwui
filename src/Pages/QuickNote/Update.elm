module Pages.QuickNote.Update exposing (quickNoteUpdate)

import Entities exposing (Note)

import Pages.QuickNote.Model exposing (QuickNoteModel)
import Pages.QuickNote.Msg exposing (QuickNoteMsg (..))


quickNoteUpdate : QuickNoteMsg -> QuickNoteModel -> QuickNoteModel
quickNoteUpdate msg model =

    case msg of

        UpdateNoteTitle string ->

            { model
            | noteTitle = string
            }

        UpdateNoteBody string ->

            { model
            | noteBody = string
            }

        AddNote ->

            { model
            | noteTitle = ""
            , noteBody = ""
            , notes = model.notes ++ [Note model.noteTitle model.noteBody]
            }