defmodule Todos.ItemView do
  use Todos.Web, :view

  def render("index.json", %{items: items}) do
    %{
      data: Enum.map(items, &todo_json/1)
    }
  end

  def render("show.json", %{item: item}) do
    %{data: todo_json(item)}
  end

  def render("update.json", %{item: item}) do
    %{data: todo_json(item)}
  end

  def render("create.json", %{item: item}) do
    %{data: todo_json(item)}
  end

  def todo_json(item) do
    %{label: item.label,  important: item.important, done: item.done, id: item.id}
  end
end
