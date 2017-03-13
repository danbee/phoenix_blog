defmodule PhoenixBlog.PageControllerTest do
  use PhoenixBlog.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Dan’s Blog"
  end
end
