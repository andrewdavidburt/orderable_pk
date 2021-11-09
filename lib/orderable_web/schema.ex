defmodule OrderableWeb.Schema do
  use Absinthe.Schema

  alias OrderableWeb.OrderResolver

  object :order do
    field :id, non_null(:id)
    field :balance, non_null(:float)
    field :description, non_null(:string)
    field :total, non_null(:float)
  end

  object :payment do
    field :id, non_null(:id)
    field :amount, non_null(:float)
    field :date_applied, non_null(:integer)
    field :note, non_null(:string)
    field :order_id, non_null(:id)
  end

  query do

    @desc "Return all orders"
    field :all_orders, non_null(list_of(non_null(:order))) do
      resolve(&OrderResolver.all_orders/3)
    end

  end

  mutation do
    @desc "Create order"
    field :create_order, :order do
      arg :balance, non_null(:float)
      arg :description, non_null(:string)
      arg :total, non_null(:float)

      resolve &OrderResolver.create_order/3
    end

    @desc "Add payment"
    field :create_payment, :payment do
      arg :amount, non_null(:float)
      arg :order_id, non_null(:id)
      resolve &OrderResolver.create_payment/3
    end
  end

end
