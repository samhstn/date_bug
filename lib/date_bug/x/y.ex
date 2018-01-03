defmodule DateBug.X.Y do
  use Ecto.Schema
  import Ecto.Changeset
  alias DateBug.X.Y


  schema "z" do
    field :date, :naive_datetime

    timestamps()
  end

  @doc false
  def changeset(%Y{} = y, attrs) do
    y
    |> cast(attrs, [:date])
    |> validate_required([:date])
  end
end
