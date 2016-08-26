defmodule PhoenixBlog.PostController do
  use PhoenixBlog.Web, :controller
  alias PhoenixBlog.Post

  def index(conn, _params) do
    posts = Repo.all(Post |> order_by(desc: :inserted_at))
    render conn, "index.html", posts: posts
  end

  def new(conn, _params) do
    new_post = Post.changeset(%Post{})
    render conn, "new.html", post: new_post
  end

  def create(conn, %{"post" => post_params}) do
    case create_post(post_params) do
      {:ok, _post} ->
        redirect(conn, to: post_path(conn, :index))
    end
  end

  defp create_post(params) do
    Post.changeset(%Post{}, params)
    |> Repo.insert
  end
end
