module Pages.QuickNote.Model exposing (QuickNoteModel, initialQuickNoteModel)

import Entities exposing (Note)


type alias QuickNoteModel =
    { noteBody : String
    , noteTitle : String
    , notes : List Note
    }


initialQuickNoteModel : QuickNoteModel
initialQuickNoteModel =
    { noteBody = ""
    , noteTitle = ""
    , notes = []
    }