defmodule Todos.Repo.Migrations.CreateItem do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :label, :string
      add :important, :boolean, default: false, null: false
      add :done, :boolean, default: false, null: false

      timestamps()
    end
  end
end
