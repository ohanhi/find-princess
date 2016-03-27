module Character (..) where


type alias Character =
    { name : String
    , favoriteColor : String
    }


princess : Character
princess =
    Character "Princess Peach" "Pink"


mario : Character
mario =
    Character "Mario" "Red"


luigi : Character
luigi =
    Character "Luigi" "Green"


boo : Character
boo =
    Character "Boo" "White"


bigBoo : Character
bigBoo =
    Character "Big Boo" "Snow White"


mechaKoopa : Character
mechaKoopa =
    Character "MechaKoopa" "Metallic Green"


goomba : Character
goomba =
    Character "Goomba" "Brown"


bill : Character
bill =
    Character "Bullet Bill" "Black"
