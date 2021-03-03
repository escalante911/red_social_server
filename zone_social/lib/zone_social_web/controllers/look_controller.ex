defmodule ZoneSocialWeb.LookController do
  use ZoneSocialWeb, :controller

  def index(conn, _params) do
    %Plug.Conn{}
    render(conn, "look.html")
  end
end
