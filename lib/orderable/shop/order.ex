defmodule Orderable.Shop.Order do
  use Ecto.Schema
  import Ecto.Changeset

  schema "orders" do
    field :balance, :float
    field :description, :string
    field :total, :float

    has_many :payments, Orderable.Shop.Payment

    timestamps()
  end

  @doc false
  def changeset(order, attrs) do
    order
    |> cast(attrs, [:description, :total, :balance])
    |> validate_required([:description, :total, :balance])
  end
end
