defmodule UsersController.Api.V1.UsersView do
  use ZoneSocialWeb, :view

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UsersController.Api.V1.UsersView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UsersController.Api.V1.UsersView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{
      name: user["_id"],
      user: user["name"],
    }

  end

end
