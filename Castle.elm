module Castle (..) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Character exposing (Character)


type alias Castle =
    { name : String
    , characters : List Character
    }


goombasCastle : Castle
goombasCastle =
    { name = ""
    , characters = []
    }


koopaTroopasCastle : Castle
koopaTroopasCastle =
    { name = ""
    , characters = []
    }


lakitusCastle : Castle
lakitusCastle =
    { name = ""
    , characters = []
    }


bowsersCastle : Castle
bowsersCastle =
    { name = "Bowser's Castle"
    , characters =
        [ { name = "Bowser"
          , favoriteColor = "Black"
          }
        , { name = "Boo"
          , favoriteColor = "White"
          }
        , { name = "Big Boo"
          , favoriteColor = "Snow White"
          }
        , { name = "MechaKoopa"
          , favoriteColor = "Green"
          }
        , Character.princess
        ]
    }


allCastles : List Castle
allCastles =
    [ goombasCastle
    , koopaTroopasCastle
    , lakitusCastle
    , bowsersCastle
    ]


hasCharacter : Character -> Castle -> Bool
hasCharacter character =
    List.member character << .characters


characterView : Character -> Html
characterView char =
    tableRow char.name char.favoriteColor


cellStyle : Attribute
cellStyle =
    style
        [ ( "padding", "5px" )
        , ( "text-align", "left" )
        ]


tableRow : String -> String -> Html
tableRow a b =
    let
        cell s =
            td [ cellStyle ] [ text s ]
    in
        tr [] [ cell a, cell b ]


view : Castle -> Html
view castle =
    div
        [ cellStyle ]
        [ h1 [] [ text castle.name ]
        , img [ src "http://www.mariowiki.com/images/c/ce/SMBDX_World_8.PNG" ] []
        , h2 [] [ text "Characters" ]
        , table []
            <| [ tr
                    []
                    [ th [ cellStyle ] [ text "Name" ]
                    , th [ cellStyle ] [ text "Favorite color" ]
                    ]
               ]
            ++ (List.map characterView castle.characters)
        ]
