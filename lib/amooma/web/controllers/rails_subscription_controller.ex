defmodule Amooma.Web.RailsSubscriptionController do
  use Amooma.Web, :controller

  alias Amooma.Interim

  def index(conn, _params) do
    rails_subscriptions = Interim.list_rails_subscriptions()
    render(conn, "index.html", rails_subscriptions: rails_subscriptions)
  end

  def new(conn, _params) do
    changeset = Interim.change_rails_subscription(%Amooma.Interim.RailsSubscription{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"rails_subscription" => rails_subscription_params}) do
    case Interim.create_rails_subscription(rails_subscription_params) do
      {:ok, rails_subscription} ->
        conn
        |> put_flash(:info, "Rails subscription created successfully.")
        |> redirect(to: rails_subscription_path(conn, :show, rails_subscription))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    rails_subscription = Interim.get_rails_subscription!(id)
    render(conn, "show.html", rails_subscription: rails_subscription)
  end

  def edit(conn, %{"id" => id}) do
    rails_subscription = Interim.get_rails_subscription!(id)
    changeset = Interim.change_rails_subscription(rails_subscription)
    render(conn, "edit.html", rails_subscription: rails_subscription, changeset: changeset)
  end

  def update(conn, %{"id" => id, "rails_subscription" => rails_subscription_params}) do
    rails_subscription = Interim.get_rails_subscription!(id)

    case Interim.update_rails_subscription(rails_subscription, rails_subscription_params) do
      {:ok, rails_subscription} ->
        conn
        |> put_flash(:info, "Rails subscription updated successfully.")
        |> redirect(to: rails_subscription_path(conn, :show, rails_subscription))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", rails_subscription: rails_subscription, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    rails_subscription = Interim.get_rails_subscription!(id)
    {:ok, _rails_subscription} = Interim.delete_rails_subscription(rails_subscription)

    conn
    |> put_flash(:info, "Rails subscription deleted successfully.")
    |> redirect(to: rails_subscription_path(conn, :index))
  end
end
