defmodule PhoenixBlog.BlogPostsTest do
  use PhoenixBlog.FeatureCase
  alias PhoenixBlog.Repo
  alias PhoenixBlog.Post

  test "visit blog post list" do
    valid_attrs = %{body: "My test content", title: "My test post"}
    Post.changeset(%Post{}, valid_attrs)
    |> Repo.insert

    navigate_to post_path(build_conn(), :index)

    assert blog_title_text() == "My test post"
  end

  test "add a blog post" do
    navigate_to post_path(build_conn(), :index)

    click({:link_text, "New Post"})

    fill_field({:name, "post[title]"}, "My new blog post")
    fill_field({:name, "post[body]"}, "This is my new amazing blog post.")

    click({:css, "button[type='submit']"})

    assert blog_title_text() == "My new blog post"
  end

  test "edit a blog post" do
    valid_attrs = %{body: "My test content", title: "My test post"}
    Post.changeset(%Post{}, valid_attrs)
    |> Repo.insert

    navigate_to post_path(build_conn(), :index)

    click({:link_text, "Edit Post"})

    fill_field({:name, "post[title]"}, "My new blog post")

    click({:css, "button[type='submit']"})

    assert blog_title_text() == "My new blog post"
  end

  test "delete a blog post" do
    valid_attrs = %{body: "My test content", title: "My test post"}
    Post.changeset(%Post{}, valid_attrs)
    |> Repo.insert

    navigate_to post_path(build_conn(), :index)

    click({:css, "a.delete-post"})

    assert !element?(:css, "article.post h1")
  end

  defp blog_title_text do
    find_element(:css, "article.post h1") |> visible_text
  end
end
