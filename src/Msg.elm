module Msg exposing (Msg (..))

import Navigation exposing (Location)
import Routes exposing (Route)

import Pages.QuickNote.Msg exposing (QuickNoteMsg)


type Msg
    = UrlChange Location
    | Navigate Route
    | QuickNoteMsg QuickNoteMsg