import Http exposing (getString, send, Error)
import Html exposing (Html, text, br, button, body, program)
import Html.Events exposing (onClick)

type Msg
  = DataRequest (Result Error String)
  | Refresh

type alias Model =
  { response : String
  , err : String
  }

main : Program Never Model Msg
main = program
  { init = init
  , view = view
  , update = update
  , subscriptions = subscriptions
  }

subscriptions : Model -> Sub Msg
subscriptions _ = Sub.none

init : (Model, Cmd Msg)
init = ({ response = "", err = ""} , Cmd.none)

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    DataRequest (Err err) -> ({ model | err = toString err}, Cmd.none)
    DataRequest (Ok response) -> ({model | response = response}, Cmd.none)
    Refresh -> (model, send DataRequest (getString "http://localhost:3000"))

view : Model -> Html Msg
view {response, err} =
  body []
    [ text <| "Response: " ++ response
    , br [] []
    , text <| "Error: " ++ err
    , br [] []
    , button [ onClick Refresh ] [ text "Send request" ]
    ]
