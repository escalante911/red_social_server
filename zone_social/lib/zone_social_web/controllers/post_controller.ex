defmodule ZoneSocialWeb.PostController do
  use ZoneSocialWeb, :controller

  def index(conn, _params) do
    %Plug.Conn{}
    render(conn, "post.html")
  end

 # def insert_post( _params) do
 #   {:ok, conn} = Mongo.start_link(url: "mongodb://localhost:27027/zone-social", username: "root", password: "pass", auth_source: "admin")
 #   %{"post" => post, "user" => user} = conn.body_params
 #   {:ok, poster} = Post.insert_post(conn, post, user)
 #   json(conn, %{
 #     post: poster.post,
 #     user: poster.user
 #   })
 # end

 def show() do
   {:ok, conn} = Mongo.start_link(url: "mongodb://localhost:27027/zone-social", username: "root", password: "pass", auth_source: "admin")
   poster = Post.consulta_post(conn)
   json(conn, %{
     id: poster.id,
     post: poster.post,
     user: poster.user
   })
 end

end
