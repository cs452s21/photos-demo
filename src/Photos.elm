module Photos exposing (main)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)


main =
    Browser.sandbox { init = init, update = update, view = view }



-- Create a new type called Msg that can be a Click contains a String


type Msg
    = Click String


type alias Model =
    { photos : List String, selectedUrl : String }


init : Model
init =
    { photos =
        [ "1.jpg"
        , "2.jpg"
        , "3.jpg"
        ]
    , selectedUrl = "1.jpg"
    }



-- A view transforms our model into a web page.


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "Photos" ]
        , div [] (List.map viewThumbnail model.photos)
        , img [ src ("../large/" ++ model.selectedUrl) ] []
        ]



-- thumbUrl is the file name coming in
-- output will be an image tag


viewThumbnail : String -> Html Msg
viewThumbnail thumbUrl =
    img [ src ("../small/" ++ thumbUrl), onClick (Click thumbUrl) ] []



-- Called in response to any event (for us, onClick)
-- update function returns a model.


update : Msg -> Model -> Model
update msg model =
    case msg of
        Click url ->
            { model | selectedUrl = url }
