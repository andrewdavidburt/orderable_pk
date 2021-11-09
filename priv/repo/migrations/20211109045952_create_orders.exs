defmodule Orderable.Repo.Migrations.CreateOrders do
  use Ecto.Migration

  def change do
    create table(:orders) do
      add :description, :string
      add :total, :float
      add :balance, :float

      timestamps()
    end
  end
end
