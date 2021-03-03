defmodule ZoneSocialWeb.FriendController do
  use ZoneSocialWeb, :controller

  def friend(conn, _params) do
    render(conn, "friend.html")
  end
end
