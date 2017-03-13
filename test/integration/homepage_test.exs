defmodule PhoenixBlog.HomepageTest do
  use PhoenixBlog.IntegrationCase

  test "visit homepage", %{session: session} do
    title =
      session
      |> visit("/")
      |> find("body")
      |> find(".header h1")
      |> text

    assert title == "Dan’s Blog"
  end
end
