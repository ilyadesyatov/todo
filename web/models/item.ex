defmodule Todos.Item do
  use Todos.Web, :model

  schema "items" do
    field :label, :string
    field :important, :boolean, default: false
    field :done, :boolean, default: false

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:label, :important, :done])
    |> validate_required([:label, :important, :done])
  end
end
