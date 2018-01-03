defmodule DateBug.XTest do
  use DateBug.DataCase

  alias DateBug.X

  describe "z" do
    alias DateBug.X.Y

    @valid_attrs %{date: ~N[2010-04-17 14:00:00.000000]}
    @update_attrs %{date: ~N[2011-05-18 15:01:01.000000]}
    @invalid_attrs %{date: nil}

    def y_fixture(attrs \\ %{}) do
      {:ok, y} =
        attrs
        |> Enum.into(@valid_attrs)
        |> X.create_y()

      y
    end

    test "list_z/0 returns all z" do
      y = y_fixture()
      assert X.list_z() == [y]
    end

    test "get_y!/1 returns the y with given id" do
      y = y_fixture()
      assert X.get_y!(y.id) == y
    end

    test "create_y/1 with valid data creates a y" do
      assert {:ok, %Y{} = y} = X.create_y(@valid_attrs)
      assert y.date == ~N[2010-04-17 14:00:00.000000]
    end

    test "create_y/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = X.create_y(@invalid_attrs)
    end

    test "update_y/2 with valid data updates the y" do
      y = y_fixture()
      assert {:ok, y} = X.update_y(y, @update_attrs)
      assert %Y{} = y
      assert y.date == ~N[2011-05-18 15:01:01.000000]
    end

    test "update_y/2 with invalid data returns error changeset" do
      y = y_fixture()
      assert {:error, %Ecto.Changeset{}} = X.update_y(y, @invalid_attrs)
      assert y == X.get_y!(y.id)
    end

    test "delete_y/1 deletes the y" do
      y = y_fixture()
      assert {:ok, %Y{}} = X.delete_y(y)
      assert_raise Ecto.NoResultsError, fn -> X.get_y!(y.id) end
    end

    test "change_y/1 returns a y changeset" do
      y = y_fixture()
      assert %Ecto.Changeset{} = X.change_y(y)
    end
  end
end
