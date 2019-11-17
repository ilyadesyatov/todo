defmodule Todos.ItemController do
  use Todos.Web, :controller
  import Plug.Conn
  alias Todos.Repo
  alias Todos.Item

  def index(conn, _params) do
    items = Repo.all(Item)
    render conn, "index.json", items: items
  end

  def show(conn, %{"id" => id} = _params) do
    item = Repo.get(Item, id)
    render conn, "show.json", item: item
  end

  def create(conn, %{"label" => label, "done" => done, "important" => important} = params) do
    item = %Item{label: label, done: done, important: important}
    case Repo.insert(item) do
      {:ok, item} ->
        render conn, "create.json", item: item
    end
  end

  def update(conn, %{"id" => id} = _params) do
    item = Repo.get(Item, id)
    if item do
      changeset = Item.changeset(item, _params)
      case Repo.update(changeset) do
        {:ok, changeset} ->
          render conn, "update.json", item: changeset
      end
    end
  end

  def delete(conn, %{"id" => id} = _params) do
    item = Repo.get(Item, id)
    Repo.delete(item)
    conn
    |> put_status(204)
    |> send_resp(:no_content, "")
  end
end