defmodule PhoenixBlog.HomepageTest do
  use PhoenixBlog.FeatureCase

  test "visit homepage" do
    navigate_to "/"
    find_element(:css, "body")

    assert title_text() == "Welcome to Phoenix!"
  end

  defp title_text do
    find_element(:css, ".jumbotron h2") |> visible_text
  end
end
