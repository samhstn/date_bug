defmodule DateBugWeb.YControllerTest do
  use DateBugWeb.ConnCase

  alias DateBug.X
  alias DateBug.X.Y

  @create_attrs %{date: ~N[2010-04-17 14:00:00.000000]}
  @update_attrs %{date: ~N[2011-05-18 15:01:01.000000]}
  @invalid_attrs %{date: nil}

  def fixture(:y) do
    {:ok, y} = X.create_y(@create_attrs)
    y
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all z", %{conn: conn} do
      conn = get conn, y_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create y" do
    test "renders y when data is valid", %{conn: conn} do
      conn = post conn, y_path(conn, :create), y: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, y_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "date" => ~N[2010-04-17 14:00:00.000000]}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, y_path(conn, :create), y: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update y" do
    setup [:create_y]

    test "renders y when data is valid", %{conn: conn, y: %Y{id: id} = y} do
      conn = put conn, y_path(conn, :update, y), y: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, y_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "date" => ~N[2011-05-18 15:01:01.000000]}
    end

    test "renders errors when data is invalid", %{conn: conn, y: y} do
      conn = put conn, y_path(conn, :update, y), y: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete y" do
    setup [:create_y]

    test "deletes chosen y", %{conn: conn, y: y} do
      conn = delete conn, y_path(conn, :delete, y)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, y_path(conn, :show, y)
      end
    end
  end

  defp create_y(_) do
    y = fixture(:y)
    {:ok, y: y}
  end
end
