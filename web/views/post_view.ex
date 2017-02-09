defmodule PhoenixBlog.PostView do
  use PhoenixBlog.Web, :view
  import Formulator

  def html_body(post) do
    {:safe, result} = Phoenix.HTML.html_escape(post.body)
    Earmark.as_html!(result, %Earmark.Options{smartypants: true})
  end
end
