defmodule BookstoreWeb.Router do
  use BookstoreWeb, :router
  use Pow.Phoenix.Router

  use Pow.Extension.Phoenix.Router,
    otp_app: :bookstore

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
    plug(BookstoreWeb.Plugs.RoutesPlug)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  pipeline :protected do
    plug(Pow.Plug.RequireAuthenticated,
      error_handler: Pow.Phoenix.PlugErrorHandler
    )
  end

  scope "/" do
    pipe_through(:browser)

    pow_routes()
    pow_extension_routes()
  end

  scope "/", BookstoreWeb do
    pipe_through([:browser, :protected])

    # Add your protected routes here
    resources("/authors", AuthorController)
    resources("/publishers", PublisherController)
    resources("/categories", CategoryController)
  end

  scope "/", BookstoreWeb do
    pipe_through(:browser)

    get("/", PageController, :index)
    resources("/books", BookController)
    get("/category/:name", CategoryController, :show_category_books)
    get("/author/:name", AuthorController, :show_author_books)
    resources("/contact", ContactController, only: [:index, :create])
    resources("/cart", CartController, only: [:update, :delete])
    get("/cart", CartController, :index)
    delete("/cart", CartController, :index)
    patch("/cart", CartController, :update)
  end

  # Other scopes may use custom stacks.
  # scope "/api", BookstoreWeb do
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
      pipe_through(:browser)
      live_dashboard("/dashboard", metrics: BookstoreWeb.Telemetry)
    end
  end
end
