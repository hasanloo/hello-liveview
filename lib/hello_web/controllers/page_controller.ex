defmodule HelloWeb.PageController do
  use HelloWeb, :controller
  alias Phoenix.LiveView

  def index(conn, _) do
    LiveView.Controller.live_render(conn, HelloWeb.LivePageView, session: %{})
  end
end
