module Character (..) where


type alias Character =
    { name : String
    , favoriteColor : String
    }


princess : Character
princess =
    { name = "Peach"
    , favoriteColor = "Pink"
    }
