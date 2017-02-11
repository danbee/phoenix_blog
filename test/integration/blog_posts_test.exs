defmodule PhoenixBlog.BlogPostsTest do
  use PhoenixBlog.IntegrationCase
  alias PhoenixBlog.Repo
  alias PhoenixBlog.Post

  test "visit blog post list", %{session: session} do
    valid_attrs = %{body: "My test content", title: "My test post"}
    Post.changeset(%Post{}, valid_attrs)
    |> Repo.insert

    post_title =
      session
      |> visit("/posts")
      |> find("article.post h1")
      |> text

    assert post_title == "My test post"
  end

  test "add a blog post", %{session: session} do
    session
    |> visit("/posts")
    |> click_link("New Post")
    |> fill_in("Title", with: "My new blog post")
    |> fill_in("Body", with: "This is my new amazing blog post.")
    |> click_button("Submit")

    post_title =
      session
      |> find("article.post h1")
      |> text

    assert post_title == "My new blog post"
  end

  test "edit a blog post", %{session: session} do
    valid_attrs = %{body: "My test content", title: "My test post"}
    Post.changeset(%Post{}, valid_attrs)
    |> Repo.insert

    session
    |> visit("/posts")
    |> click_link("Edit Post")
    |> fill_in("Title", with: "My new blog post")
    |> click_button("Submit")

    post_title =
      session
      |> find("article.post h1")
      |> text

    assert post_title == "My new blog post"
  end

  test "delete a blog post", %{session: session} do
    valid_attrs = %{body: "My test content", title: "My test post"}
    Post.changeset(%Post{}, valid_attrs)
    |> Repo.insert

    session
    |> visit("/posts")
    |> click_link("Delete Post")

    assert has_no_css?(session, "article.post h1")
  end
end
