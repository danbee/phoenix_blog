defmodule PhoenixBlog.BlogPostsTest do
  use PhoenixBlog.FeatureCase
  alias PhoenixBlog.Repo
  alias PhoenixBlog.Post

  test "visit blog post list" do
    valid_attrs = %{body: "My test content", title: "My test post"}
    Post.changeset(%Post{}, valid_attrs)
    |> Repo.insert

    navigate_to "/posts"

    assert blog_title_text == "My test post"
  end

  test "add a blog post" do
    navigate_to "/posts"

    find_element(:css, "a.new-post")
    |> click

    find_element(:name, "post[title]")
    |> fill_field("My new blog post")

    find_element(:name, "post[body]")
    |> fill_field("This is my new amazing blog post.")

    find_element(:css, "input[type='submit']")
    |> click

    assert blog_title_text == "My new blog post"
  end

  defp blog_title_text do
    find_element(:css, "article.post h1") |> visible_text
  end
end
