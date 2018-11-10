module Main exposing (Model, Msg(..), init, main, update, view)

import Html exposing (Html, div, h1, img, node, text)
import Html.Events exposing (onClick)



---- MODEL ----


type alias Model =
    { counter : Int
    }


init : ( Model, Cmd Msg )
init =
    ( { counter = 0 }, Cmd.none )



---- UPDATE ----


type Msg
    = NoOp
    | Increment
    | Decrement


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            model ! []

        Increment ->
            { model | counter = model.counter + 1 } ! []

        Decrement ->
            { model | counter = model.counter - 1 } ! []



---- VIEW ----


view : Model -> Html Msg
view model =
    div []
        [ Html.p [] [ text "Elm is here!" ]
        , node "ion-button" [ onClick Increment ] [ text "+" ]
        , node "ion-button" [ onClick Decrement ] [ text "-" ]
        , Html.p [] [ text <| "Count is " ++ toString model.counter ]
        ]


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        }
