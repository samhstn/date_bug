defmodule DateBug.X do
  @moduledoc """
  The X context.
  """

  import Ecto.Query, warn: false
  alias DateBug.Repo

  alias DateBug.X.Y

  @doc """
  Returns the list of z.

  ## Examples

      iex> list_z()
      [%Y{}, ...]

  """
  def list_z do
    Repo.all(Y)
  end

  @doc """
  Gets a single y.

  Raises `Ecto.NoResultsError` if the Y does not exist.

  ## Examples

      iex> get_y!(123)
      %Y{}

      iex> get_y!(456)
      ** (Ecto.NoResultsError)

  """
  def get_y!(id), do: Repo.get!(Y, id)

  @doc """
  Creates a y.

  ## Examples

      iex> create_y(%{field: value})
      {:ok, %Y{}}

      iex> create_y(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_y(attrs \\ %{}) do
    %Y{}
    |> Y.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a y.

  ## Examples

      iex> update_y(y, %{field: new_value})
      {:ok, %Y{}}

      iex> update_y(y, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_y(%Y{} = y, attrs) do
    y
    |> Y.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Y.

  ## Examples

      iex> delete_y(y)
      {:ok, %Y{}}

      iex> delete_y(y)
      {:error, %Ecto.Changeset{}}

  """
  def delete_y(%Y{} = y) do
    Repo.delete(y)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking y changes.

  ## Examples

      iex> change_y(y)
      %Ecto.Changeset{source: %Y{}}

  """
  def change_y(%Y{} = y) do
    Y.changeset(y, %{})
  end
end
