defmodule PhoenixBlog.PostView do
  use PhoenixBlog.Web, :view

  def html_body(post) do
    {:safe, result} = Phoenix.HTML.html_escape(post.body)
    Earmark.to_html(result, %Earmark.Options{smartypants: true})
  end
end
