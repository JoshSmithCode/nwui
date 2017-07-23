module Model exposing (Model, initialModel)

import Routes exposing (Route (NotFound))
import Types exposing (PageState (NoPage), Page)


type alias Model =
    { route : Route
    , page : PageState
    }


initialModel =
    { route = NotFound
    , page = NoPage
    }