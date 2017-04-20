defmodule Amooma.Web.RailsSubscriptionControllerTest do
  use Amooma.Web.ConnCase

  alias Amooma.Interim

  @create_attrs %{email: "some email", first_name: "some first_name", gender: "some gender", last_name: "some last_name"}
  @update_attrs %{email: "some updated email", first_name: "some updated first_name", gender: "some updated gender", last_name: "some updated last_name"}
  @invalid_attrs %{email: nil, first_name: nil, gender: nil, last_name: nil}

  def fixture(:rails_subscription) do
    {:ok, rails_subscription} = Interim.create_rails_subscription(@create_attrs)
    rails_subscription
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, rails_subscription_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing Rails subscriptions"
  end

  test "renders form for new rails_subscriptions", %{conn: conn} do
    conn = get conn, rails_subscription_path(conn, :new)
    assert html_response(conn, 200) =~ "New Rails subscription"
  end

  test "creates rails_subscription and redirects to show when data is valid", %{conn: conn} do
    conn = post conn, rails_subscription_path(conn, :create), rails_subscription: @create_attrs

    assert %{id: id} = redirected_params(conn)
    assert redirected_to(conn) == rails_subscription_path(conn, :show, id)

    conn = get conn, rails_subscription_path(conn, :show, id)
    assert html_response(conn, 200) =~ "Show Rails subscription"
  end

  test "does not create rails_subscription and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, rails_subscription_path(conn, :create), rails_subscription: @invalid_attrs
    assert html_response(conn, 200) =~ "New Rails subscription"
  end

  test "renders form for editing chosen rails_subscription", %{conn: conn} do
    rails_subscription = fixture(:rails_subscription)
    conn = get conn, rails_subscription_path(conn, :edit, rails_subscription)
    assert html_response(conn, 200) =~ "Edit Rails subscription"
  end

  test "updates chosen rails_subscription and redirects when data is valid", %{conn: conn} do
    rails_subscription = fixture(:rails_subscription)
    conn = put conn, rails_subscription_path(conn, :update, rails_subscription), rails_subscription: @update_attrs
    assert redirected_to(conn) == rails_subscription_path(conn, :show, rails_subscription)

    conn = get conn, rails_subscription_path(conn, :show, rails_subscription)
    assert html_response(conn, 200) =~ "some updated email"
  end

  test "does not update chosen rails_subscription and renders errors when data is invalid", %{conn: conn} do
    rails_subscription = fixture(:rails_subscription)
    conn = put conn, rails_subscription_path(conn, :update, rails_subscription), rails_subscription: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit Rails subscription"
  end

  test "deletes chosen rails_subscription", %{conn: conn} do
    rails_subscription = fixture(:rails_subscription)
    conn = delete conn, rails_subscription_path(conn, :delete, rails_subscription)
    assert redirected_to(conn) == rails_subscription_path(conn, :index)
    assert_error_sent 404, fn ->
      get conn, rails_subscription_path(conn, :show, rails_subscription)
    end
  end
end
