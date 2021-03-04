defmodule ZoneSocialWeb.UserController do
  use ZoneSocialWeb, :controller

  alias ZoneSocial.User
  alias ZoneSocial.Router.Helpers, as: Routes

  def index(conn, _params) do
    %Plug.Conn{}
    render(conn, "user.html")
  end

   def insert( _params) do
     {:ok, conn} = Mongo.start_link(url: "mongodb://localhost:27027/zone-social", username: "root", password: "pass", auth_source: "admin")
     %{"name" => name, "user" => user} = conn.body_params
     {:ok, user} = User.insert_user(conn, name, user)
     json(conn, %{
       name: user.name,
       user: user.user
     })
   end

  def show() do
    {:ok, conn} = Mongo.start_link(url: "mongodb://localhost:27027/zone-social", username: "root", password: "pass", auth_source: "admin")
    user = User.consulta_user(conn)
    json(conn, %{
      id: user.id,
      name: user.name,
      user: user.user
    })
  end

end
