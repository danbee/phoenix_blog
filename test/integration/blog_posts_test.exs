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
      |> visit("/")
      |> find(Query.css("article.post h1"))
      |> Element.text

    assert post_title == "My test post"
  end

  test "add a blog post", %{session: session} do
    session
    |> visit("/")
    |> click(Query.link("New Post"))
    |> fill_in(Query.text_field("Title"), with: "My new blog post")
    |> execute_script("window.postEditor.value('This is my new amazing blog post.')")

    session
    |> click(Query.button("Submit"))

    post_title =
      session
      |> find(Query.css("article.post h1"))
      |> Element.text

    assert post_title == "My new blog post"
  end

  test "edit a blog post", %{session: session} do
    valid_attrs = %{body: "My test content", title: "My test post"}
    Post.changeset(%Post{}, valid_attrs)
    |> Repo.insert

    session
    |> visit("/")
    |> click(Query.link("Edit Post"))
    |> fill_in(Query.text_field("Title"), with: "My new blog post")
    |> click(Query.button("Submit"))

    post_title =
      session
      |> find(Query.css("article.post h1"))
      |> Element.text

    assert post_title == "My new blog post"
  end

  test "delete a blog post", %{session: session} do
    valid_attrs = %{body: "My test content", title: "My test post"}
    Post.changeset(%Post{}, valid_attrs)
    |> Repo.insert

    session
    |> visit("/")
    |> click(Query.link("Delete Post"))

    assert has_no_css?(session, "article.post h1")
  end
end
