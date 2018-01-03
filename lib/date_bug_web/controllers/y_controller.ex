defmodule DateBugWeb.YController do
  use DateBugWeb, :controller

  alias DateBug.X
  alias DateBug.X.Y

  action_fallback DateBugWeb.FallbackController

  def index(conn, _params) do
    z = X.list_z()
    render(conn, "index.json", z: z)
  end

  def create(conn, %{"y" => y_params}) do
    with {:ok, %Y{} = y} <- X.create_y(y_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", y_path(conn, :show, y))
      |> render("show.json", y: y)
    end
  end

  def show(conn, %{"id" => id}) do
    y = X.get_y!(id)
    render(conn, "show.json", y: y)
  end

  def update(conn, %{"id" => id, "y" => y_params}) do
    y = X.get_y!(id)

    with {:ok, %Y{} = y} <- X.update_y(y, y_params) do
      render(conn, "show.json", y: y)
    end
  end

  def delete(conn, %{"id" => id}) do
    y = X.get_y!(id)
    with {:ok, %Y{}} <- X.delete_y(y) do
      send_resp(conn, :no_content, "")
    end
  end
end
