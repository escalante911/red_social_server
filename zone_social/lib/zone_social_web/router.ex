defmodule ZoneSocialWeb.Router do
  use ZoneSocialWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug ZoneSocialWeb.Plugs.Locale, "en"
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", UsersController, as: :api do
    pipe_through :api

    scope "/v1", Api.V1, as: :v1 do
      resources "/users", UsersController, only: [:index, :show]
    end
  end

  scope "/", ZoneSocialWeb do
    pipe_through :browser

    get "/", PageController, :index
    # get "/friend", FriendController, :index
    #get "/user", UserController, :index
    # get "/", UserController, :index
    # resources "/friend", FriendController
    resources "/user", UserController, only: [:index, :show]
    resources "/post", PostController, only: [:index, :show]
    resources "/friend", FriendController #, only: [:index, :show]


    resources "/look", LookController, only: [:index, :show]
  end

  # Other scopes may use custom stacks.
  # scope "/api", ZoneSocialWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: ZoneSocialWeb.Telemetry
    end
  end
end
