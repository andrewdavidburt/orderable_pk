defmodule Orderable.ShopTest do
  use Orderable.DataCase

  alias Orderable.Shop

  describe "orders" do
    alias Orderable.Shop.Order

    import Orderable.ShopFixtures

    @invalid_attrs %{balance: nil, description: nil, total: nil}

    test "list_orders/0 returns all orders" do
      order = order_fixture()
      assert Shop.list_orders() == [order]
    end

    test "get_order!/1 returns the order with given id" do
      order = order_fixture()
      assert Shop.get_order!(order.id) == order
    end

    test "create_order/1 with valid data creates a order" do
      valid_attrs = %{balance: 120.5, description: "some description", total: 120.5}

      assert {:ok, %Order{} = order} = Shop.create_order(valid_attrs)
      assert order.balance == 120.5
      assert order.description == "some description"
      assert order.total == 120.5
    end

    test "create_order/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Shop.create_order(@invalid_attrs)
    end

    test "update_order/2 with valid data updates the order" do
      order = order_fixture()
      update_attrs = %{balance: 456.7, description: "some updated description", total: 456.7}

      assert {:ok, %Order{} = order} = Shop.update_order(order, update_attrs)
      assert order.balance == 456.7
      assert order.description == "some updated description"
      assert order.total == 456.7
    end

    test "update_order/2 with invalid data returns error changeset" do
      order = order_fixture()
      assert {:error, %Ecto.Changeset{}} = Shop.update_order(order, @invalid_attrs)
      assert order == Shop.get_order!(order.id)
    end

    test "delete_order/1 deletes the order" do
      order = order_fixture()
      assert {:ok, %Order{}} = Shop.delete_order(order)
      assert_raise Ecto.NoResultsError, fn -> Shop.get_order!(order.id) end
    end

    test "change_order/1 returns a order changeset" do
      order = order_fixture()
      assert %Ecto.Changeset{} = Shop.change_order(order)
    end
  end

  describe "payments" do
    alias Orderable.Shop.Payment

    import Orderable.ShopFixtures

    @invalid_attrs %{amount: nil}

    test "list_payments/0 returns all payments" do
      payment = payment_fixture()
      assert Shop.list_payments() == [payment]
    end

    test "get_payment!/1 returns the payment with given id" do
      payment = payment_fixture()
      assert Shop.get_payment!(payment.id) == payment
    end

    test "create_payment/1 with valid data creates a payment" do
      valid_attrs = %{amount: 120.5}

      assert {:ok, %Payment{} = payment} = Shop.create_payment(valid_attrs)
      assert payment.amount == 120.5
    end

    test "create_payment/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Shop.create_payment(@invalid_attrs)
    end

    test "update_payment/2 with valid data updates the payment" do
      payment = payment_fixture()
      update_attrs = %{amount: 456.7}

      assert {:ok, %Payment{} = payment} = Shop.update_payment(payment, update_attrs)
      assert payment.amount == 456.7
    end

    test "update_payment/2 with invalid data returns error changeset" do
      payment = payment_fixture()
      assert {:error, %Ecto.Changeset{}} = Shop.update_payment(payment, @invalid_attrs)
      assert payment == Shop.get_payment!(payment.id)
    end

    test "delete_payment/1 deletes the payment" do
      payment = payment_fixture()
      assert {:ok, %Payment{}} = Shop.delete_payment(payment)
      assert_raise Ecto.NoResultsError, fn -> Shop.get_payment!(payment.id) end
    end

    test "change_payment/1 returns a payment changeset" do
      payment = payment_fixture()
      assert %Ecto.Changeset{} = Shop.change_payment(payment)
    end
  end
end
