defmodule Orderable.Repo.Migrations.CreatePayments do
  use Ecto.Migration

  def change do
    create table(:payments) do
      add :amount, :float
      add :order_id, references(:orders, on_delete: :nothing)
      add :note, :string
      add :date_applied, :integer

      timestamps()
    end

    create index(:payments, [:order_id])
  end
end
