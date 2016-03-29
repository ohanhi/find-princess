module Castle (..) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Character exposing (..)


type alias Castle =
  { name : String
  , image : String
  , characters : List Character
  }


wendysCastle : Castle
wendysCastle =
  { name = "Wendy's Castle"
  , image = "http://www.mariowiki.com/images/9/9c/SMW_WendyBattle.PNG"
  , characters =
      [ goomba
      , bill
      , mechaKoopa
      , Character "Spiny" "Orange"
      , Character "Wendy O. Koopa" "Rose"
      ]
  }


koopaTroopasCastle : Castle
koopaTroopasCastle =
  { name = "Larry's Castle"
  , image = "http://www.mariowiki.com/images/thumb/9/9c/Larry'sCastle.PNG/180px-Larry'sCastle.PNG"
  , characters =
      [ boo
      , bigBoo
      , mechaKoopa
      , goomba
      , mario
      , Character "Larry Koopa" "Yellow"
      ]
  }


lakitusCastle : Castle
lakitusCastle =
  { name = "Iggy's Castle"
  , image = "http://www.mariowiki.com/images/7/7d/Iggy%27s_Castle_Crusher_Room.PNG"
  , characters =
      [ Character "Iggy Koopa" "Yellow"
      , goomba
      , Character "Spiny" "Orange"
      , Character "Spiny Egg" "-"
      , bill
      , luigi
      ]
  }


bowsersCastle : Castle
bowsersCastle =
  { name = "Bowser's Castle"
  , image = "http://www.mariowiki.com/images/b/ba/SMW_Bowserscastle.png"
  , characters =
      [ Character "Bowser" "Black"
      , boo
      , bigBoo
      , mechaKoopa
      , princess
      ]
  }


allCastles : List Castle
allCastles =
  [ wendysCastle
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
    , ( "width", "50%" )
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
    [ style
        [ ( "padding", "10px" )
        , ( "margin", "10px" )
        , ( "border", "1px solid #666" )
        , ( "width", "300px" )
        , ( "float", "left" )
        ]
    ]
    [ h1 [] [ text castle.name ]
    , img [ src castle.image, style [ ( "width", "100%" ) ] ] []
    , h2 [] [ text ("Characters in " ++ castle.name) ]
    , table [ style [ ( "width", "100%" ) ] ]
        <| [ tr
              []
              [ th [ cellStyle ] [ text "Name" ]
              , th [ cellStyle ] [ text "Favorite color" ]
              ]
           ]
        ++ (List.map characterView castle.characters)
    ]
