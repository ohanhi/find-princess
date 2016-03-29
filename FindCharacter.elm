module FindCharacter (..) where

import String
import StartApp.Simple as StartApp
import Html exposing (Html, div, input)
import Html.Events exposing (..)
import Html.Attributes exposing (..)
import Castle exposing (Castle)


-- Model


type alias Model =
  { search : String
  , castles : List Castle
  }


model : Model
model =
  { search = ""
  , castles = Castle.allCastles
  }



-- Update


type Action
  = SearchFor String


update : Action -> Model -> Model
update action state =
  case action of
    SearchFor needle ->
      { state | search = needle }



-- View


view : Signal.Address Action -> Model -> Html
view address model =
  let
    inputField =
      input [ onInput address, inputStyles, placeholder "Search" ] []

    castles =
      model.castles
        |> filterCastles model.search
        |> List.map Castle.view
  in
    div
      []
      [ inputField
      , div [ style [ ( "overflow", "hidden" ) ] ] castles
      ]



-- Start


main : Signal Html
main =
  StartApp.start
    { model = model, view = view, update = update }



-- Helpers


filterCastles : String -> List Castle -> List Castle
filterCastles search castles =
  castles
    |> List.filter (anyCharacterStartingWith search)


anyCharacterStartingWith : String -> Castle -> Bool
anyCharacterStartingWith search castle =
  castle.characters
    |> List.map .name
    |> List.map String.toLower
    |> List.map (String.startsWith search)
    |> List.member True


onInput : Signal.Address Action -> Html.Attribute
onInput address =
  on "input" targetValue (Signal.message address << SearchFor)


inputStyles : Html.Attribute
inputStyles =
  style
    [ ( "font-size", "2em" )
    , ( "border", "1px solid black" )
    , ( "margin", "10px" )
    , ( "text-align", "center" )
    ]
