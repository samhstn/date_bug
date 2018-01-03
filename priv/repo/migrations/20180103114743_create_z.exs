defmodule DateBug.Repo.Migrations.CreateZ do
  use Ecto.Migration

  def change do
    create table(:z) do
      add :date, :naive_datetime

      timestamps()
    end

  end
end
