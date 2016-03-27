module Character (..) where


type alias Character =
    { name : String
    , favoriteColor : String
    }


princess : Character
princess =
    Character "Princess Peach" "Pink"


mario =
    Character "Mario" "Red"


luigi =
    Character "Luigi" "Green"


boo =
    Character "Boo" "White"


bigBoo =
    Character "Big Boo" "Snow White"


mechaKoopa =
    Character "MechaKoopa" "Metallic Green"


goomba =
    Character "Goomba" "Brown"


bill =
    Character "Bullet Bill" "Black"
