defmodule OurFirstApiTest.RouterTest do
  # http endpoints have to be tested asynchronous
  use ExUnit.Case, async: true

  # using Plug to test http endpoints
  use Plug.Test

  # using a variable here to test the api and initialize the router
  @opts OurFirstApi.Router.init([])

  test "return ok" do
    build_conn = conn(:get, "/")
    conn = OurFirstApi.Router.call(build_conn, @opts)

    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == "OK"
  end
end
