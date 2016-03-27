module FindPrincess (..) where

import Html exposing (Html, div)
import Character exposing (Character)
import Castle exposing (Castle)


isCharacterInCastle : Character -> Castle -> Bool
isCharacterInCastle character castle =
    Castle.hasCharacter character castle


isPrincessInCastle : Castle -> Bool
isPrincessInCastle =
    isCharacterInCastle Character.princess


castlesWithPrincess : List Castle
castlesWithPrincess =
    List.filter isPrincessInCastle Castle.allCastles


main : Html
main =
    div [] (List.map Castle.view castlesWithPrincess)
