defmodule Amooma.InterimTest do
  use Amooma.DataCase

  alias Amooma.Interim
  alias Amooma.Interim.RailsSubscription

  @create_attrs %{email: "some email", first_name: "some first_name", gender: "some gender", last_name: "some last_name"}
  @update_attrs %{email: "some updated email", first_name: "some updated first_name", gender: "some updated gender", last_name: "some updated last_name"}
  @invalid_attrs %{email: nil, first_name: nil, gender: nil, last_name: nil}

  def fixture(:rails_subscription, attrs \\ @create_attrs) do
    {:ok, rails_subscription} = Interim.create_rails_subscription(attrs)
    rails_subscription
  end

  test "list_rails_subscriptions/1 returns all rails_subscriptions" do
    rails_subscription = fixture(:rails_subscription)
    assert Interim.list_rails_subscriptions() == [rails_subscription]
  end

  test "get_rails_subscription! returns the rails_subscription with given id" do
    rails_subscription = fixture(:rails_subscription)
    assert Interim.get_rails_subscription!(rails_subscription.id) == rails_subscription
  end

  test "create_rails_subscription/1 with valid data creates a rails_subscription" do
    assert {:ok, %RailsSubscription{} = rails_subscription} = Interim.create_rails_subscription(@create_attrs)
    assert rails_subscription.email == "some email"
    assert rails_subscription.first_name == "some first_name"
    assert rails_subscription.gender == "some gender"
    assert rails_subscription.last_name == "some last_name"
  end

  test "create_rails_subscription/1 with invalid data returns error changeset" do
    assert {:error, %Ecto.Changeset{}} = Interim.create_rails_subscription(@invalid_attrs)
  end

  test "update_rails_subscription/2 with valid data updates the rails_subscription" do
    rails_subscription = fixture(:rails_subscription)
    assert {:ok, rails_subscription} = Interim.update_rails_subscription(rails_subscription, @update_attrs)
    assert %RailsSubscription{} = rails_subscription
    assert rails_subscription.email == "some updated email"
    assert rails_subscription.first_name == "some updated first_name"
    assert rails_subscription.gender == "some updated gender"
    assert rails_subscription.last_name == "some updated last_name"
  end

  test "update_rails_subscription/2 with invalid data returns error changeset" do
    rails_subscription = fixture(:rails_subscription)
    assert {:error, %Ecto.Changeset{}} = Interim.update_rails_subscription(rails_subscription, @invalid_attrs)
    assert rails_subscription == Interim.get_rails_subscription!(rails_subscription.id)
  end

  test "delete_rails_subscription/1 deletes the rails_subscription" do
    rails_subscription = fixture(:rails_subscription)
    assert {:ok, %RailsSubscription{}} = Interim.delete_rails_subscription(rails_subscription)
    assert_raise Ecto.NoResultsError, fn -> Interim.get_rails_subscription!(rails_subscription.id) end
  end

  test "change_rails_subscription/1 returns a rails_subscription changeset" do
    rails_subscription = fixture(:rails_subscription)
    assert %Ecto.Changeset{} = Interim.change_rails_subscription(rails_subscription)
  end
end
