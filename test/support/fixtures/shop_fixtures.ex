defmodule Orderable.ShopFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Orderable.Shop` context.
  """

  @doc """
  Generate a order.
  """
  def order_fixture(attrs \\ %{}) do
    {:ok, order} =
      attrs
      |> Enum.into(%{
        balance: 120.5,
        description: "some description",
        total: 120.5
      })
      |> Orderable.Shop.create_order()

    order
  end

  @doc """
  Generate a payment.
  """
  def payment_fixture(attrs \\ %{}) do
    {:ok, payment} =
      attrs
      |> Enum.into(%{
        amount: 120.5
      })
      |> Orderable.Shop.create_payment()

    payment
  end
end
