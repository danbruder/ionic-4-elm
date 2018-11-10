module Main exposing (Msg(..), main, update, view)

import Browser
import Html exposing (Html, button, div, node, text)
import Html.Attributes exposing (attribute, style)
import Html.Events exposing (on, onClick)


main =
    Browser.sandbox { init = 0, update = update, view = view }


type Msg
    = Increment
    | Decrement


type alias Model =
    Int


update msg model =
    case msg of
        Increment ->
            model + 1

        Decrement ->
            model - 1


view : Model -> Html Msg
view model =
    node "ion-app"
        []
        [ node "ion-header"
            []
            [ node "ion-toolbar"
                []
                [ node "ion-title" [] [ text "Elm and Ionic" ]
                ]
            ]
        , node "ion-content"
            [ style "height" "100vh" ]
            [ node "ion-button" [ onClick Increment ] [ text "+" ]
            , node "ion-button" [ onClick Decrement ] [ text "-" ]
            , node "ion-item"
                []
                [ node "ion-label" [] [ text "Cool" ]
                , node "ion-toggle" [] []
                ]
            , node "ion-item"
                []
                [ node "ion-label" [] [ text "Beans" ]
                , node "ion-toggle" [] []
                ]
            , node "ion-item"
                []
                [ node "ion-label" [] [ text "Foo" ]
                , node "ion-toggle" [] []
                ]
            ]
        ]
