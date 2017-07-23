module Types exposing (PageState (..), Page (..))

import Pages.Home.Model exposing (HomeModel)
import Pages.QuickNote.Model exposing (QuickNoteModel)


type PageState
    = NoPage
    | Loading
    | Loaded Page
    | Error Page


type Page
    = HomePage HomeModel
    | QuickNotePage QuickNoteModel



