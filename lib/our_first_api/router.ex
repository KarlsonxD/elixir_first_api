defmodule OurFirstApi.Router do
  use Plug.Router

  # request should be logged to console
  plug(Plug.Logger)

  # route verification
  plug(:match)

  # the order matters, we only want to parse the body data, if the request matches an endpoint
  plug(Plug.Parsers,
    parsers: [:json],
    pass: ["application/json"],
    json_decoder: Jason
  )

  plug(:dispatch)

  # adding default/fallback endpoints
  get("/", do: send_resp(conn, 200, "OK"))
  match(_, do: send_resp(conn, 404, "ERROR"))
end
