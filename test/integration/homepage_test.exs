defmodule PhoenixBlog.HomepageTest do
  use PhoenixBlog.IntegrationCase

  test "visit homepage", %{session: session} do
    title =
      session
      |> visit("/")
      |> find(Query.css("body"))
      |> find(Query.css(".header h1"))
      |> Element.text

    assert title == "Dan’s Blog"
  end
end
