defmodule DateBugWeb.PageController do
  use DateBugWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
