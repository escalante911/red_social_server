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

   def show(%Plug.Conn{query_params: query_params} = conn) do
    {:ok, conn} = Mongo.start_link(url: "mongodb://localhost:27027/zone-social", username: "root", password: "pass", auth_source: "admin")
    user = User.consulta_users(conn)
    case query_params["format"] do
      "json" ->  json(conn, %{
                      id: user.id,
                      name: user.name,
                      user: user.user
                      })
      "text" -> text(conn, "From messenger")
      _      -> render(conn, "show.html")
    end

  end

end
