defmodule OrderableWeb.OrderResolver do
  use Ecto.Migration

  alias Orderable.Shop

  def all_orders(_root, _args, _info) do
    {:ok, Shop.list_orders()}
  end

  def create_order(_root, args, _info) do
    # TODO: add detailed error message handling later
    case Shop.create_order(args) do
      {:ok, order} ->
        {:ok, order}
      _error ->
        {:error, "can't create order"}
    end
  end

  def create_payment(_root, args, _info) do
    # TODO: add detailed error message handling later
    case Shop.create_payment(args) do
      {:ok, payment} ->
        {:ok, payment}
      _error ->
        {:error, "can't add payment"}
    end
  end

end
