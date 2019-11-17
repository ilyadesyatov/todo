defmodule Todos.ItemTest do
  use Todos.ModelCase

  alias Todos.Item

  @valid_attrs %{done: true, important: true, label: "some label"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Item.changeset(%Item{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Item.changeset(%Item{}, @invalid_attrs)
    refute changeset.valid?
  end
end
