defmodule ZoneSocialWeb.PageController do
  use ZoneSocialWeb, :controller

  def index(conn, _params) do
    %Plug.Conn{}
    render(conn, "index.html")
  end

end
