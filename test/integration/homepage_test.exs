defmodule PhoenixBlog.HomepageTest do
  use PhoenixBlog.IntegrationCase, async: true

  test "visit homepage", %{session: session} do
    title =
      session
      |> visit("/")
      |> find("body")
      |> find(".jumbotron h2")
      |> text

    assert title == "Welcome to Phoenix!"
  end
end
