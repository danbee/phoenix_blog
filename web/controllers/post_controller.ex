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

  def edit(conn, %{"id" => id}) do
    post = Repo.get!(Post, id)
    |> Post.changeset(%{})
    render conn, "edit.html", post: post
  end

  def update(conn, %{"id" => id, "post" => post_params}) do
    case update_post(id, post_params) do
      {:ok, _post} ->
        redirect(conn, to: post_path(conn, :index))
    end
  end

  defp update_post(id, params) do
    Repo.get!(Post, id)
    |> Post.changeset(params)
    |> Repo.update
  end

  defp create_post(params) do
    Post.changeset(%Post{}, params)
    |> Repo.insert
  end
end
