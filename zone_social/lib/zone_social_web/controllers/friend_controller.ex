defmodule ZoneSocialWeb.FriendController do
  use ZoneSocialWeb, :controller

  def index(conn, _params) do
    %Plug.Conn{}
    render(conn, "friend.html")
  end
end
