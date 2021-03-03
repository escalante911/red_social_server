defmodule ZoneSocialWeb.UserController do
  use ZoneSocialWeb, :controller

  def index(conn, _params) do
    %Plug.Conn{}
    render(conn, "user.html")
  end
end
