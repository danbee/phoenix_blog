defmodule PhoenixBlog.PostView do
  use PhoenixBlog.Web, :view
  import Formulator

  def html_body(post) do
    # TODO: Filter out `script` tags.
    Earmark.as_html!(post.body, %Earmark.Options{smartypants: true})
  end
end
