defmodule ZoneSocialWeb.PostController do
  use ZoneSocialWeb, :controller

  def index(conn, _params) do
    %Plug.Conn{}
    render(conn, "post.html")
  end
end
