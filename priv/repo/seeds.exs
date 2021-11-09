# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Orderable.Repo.insert!(%Orderable.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Orderable.Shop.Order
alias Orderable.Repo

%Order{balance: 12.12, description: "printer", total: 12.13} |> Repo.insert!
