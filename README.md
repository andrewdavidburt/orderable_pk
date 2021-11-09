# Orderable

Written in Phoenix/Absinthe/Elixir/Postgres. Currently only implements create order, add/create payment, show/list all orders. 

list orders:
{
  allOrders {
    id
    total
    balance
    description
  }
}

add order:
mutation {
  createOrder(
    balance: 20.20,
    description: "scanner",
    total:20.20
  ) {
    id
    balance
    description
    total
  }
}

add payment:
mutation {
  createPayment(
    amount: 2.2,
    order_id: ":2",
  ) {
    amount
    order_id
  }
}


To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup` (requires Postgres)
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Hosted at [`localhost:4000`](http://localhost:4000). 

It's currently set to use GraphiQL for troubleshooting, visit localhost:4000/graphiql


## Learn more

  * Official website: https://www.phoenixframework.org/
