module Pages.QuickNote.Msg exposing (QuickNoteMsg (..))


type QuickNoteMsg
    = UpdateNoteTitle String
    | UpdateNoteBody String
    | AddNote