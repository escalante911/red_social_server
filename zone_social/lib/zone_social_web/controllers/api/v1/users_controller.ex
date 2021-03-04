defmodule UsersController.Api.V1.UsersController do
  use ZoneSocialWeb, :controller

  alias ZoneSocial.User

  def index(conn, _params) do
    {:ok, cone} = Mongo.start_link(url: "mongodb://localhost:27027/zone-social", username: "root", password: "pass", auth_source: "admin")
    users = User.consulta_users(cone)
    render(conn, "index.json", users: users)
  end

  def show(conn, %{"id" => id}) do
    {:ok, cone} = Mongo.start_link(url: "mongodb://localhost:27027/zone-social", username: "root", password: "pass", auth_source: "admin")
    user = User.consulta_user(cone, id)
    render(conn, "show.json", user: user)
  end

end
