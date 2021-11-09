defmodule Orderable.Shop.Payment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "payments" do
    field :amount, :float
    field :date_applied, :integer
    field :note, :string
    field :order_id, :id

    belongs_to :orders, Orderable.Shop.Order
    timestamps()
  end

  @doc false
  def changeset(payment, attrs) do
    payment
    |> cast(attrs, [:amount])
    |> validate_required([:amount])
  end
end
