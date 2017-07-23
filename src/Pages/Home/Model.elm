module Pages.Home.Model exposing (HomeModel, initialHomeModel)


type alias HomeModel =
    { welcome : String
    }


initialHomeModel : HomeModel
initialHomeModel =
    { welcome = ""
    }