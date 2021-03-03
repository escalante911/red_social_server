defmodule ZoneSocialWeb.PageController do
  use ZoneSocialWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

end
