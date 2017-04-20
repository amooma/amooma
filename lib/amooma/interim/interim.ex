defmodule Amooma.Interim do
  @moduledoc """
  The boundary for the Interim system.
  """

  import Ecto.{Query, Changeset}, warn: false
  alias Amooma.Repo

  alias Amooma.Interim.RailsSubscription

  @doc """
  Returns the list of rails_subscriptions.

  ## Examples

      iex> list_rails_subscriptions()
      [%RailsSubscription{}, ...]

  """
  def list_rails_subscriptions do
    Repo.all(RailsSubscription)
  end

  @doc """
  Gets a single rails_subscription.

  Raises `Ecto.NoResultsError` if the Rails subscription does not exist.

  ## Examples

      iex> get_rails_subscription!(123)
      %RailsSubscription{}

      iex> get_rails_subscription!(456)
      ** (Ecto.NoResultsError)

  """
  def get_rails_subscription!(id), do: Repo.get!(RailsSubscription, id)

  @doc """
  Creates a rails_subscription.

  ## Examples

      iex> create_rails_subscription(%{field: value})
      {:ok, %RailsSubscription{}}

      iex> create_rails_subscription(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_rails_subscription(attrs \\ %{}) do
    %RailsSubscription{}
    |> rails_subscription_changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a rails_subscription.

  ## Examples

      iex> update_rails_subscription(rails_subscription, %{field: new_value})
      {:ok, %RailsSubscription{}}

      iex> update_rails_subscription(rails_subscription, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_rails_subscription(%RailsSubscription{} = rails_subscription, attrs) do
    rails_subscription
    |> rails_subscription_changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a RailsSubscription.

  ## Examples

      iex> delete_rails_subscription(rails_subscription)
      {:ok, %RailsSubscription{}}

      iex> delete_rails_subscription(rails_subscription)
      {:error, %Ecto.Changeset{}}

  """
  def delete_rails_subscription(%RailsSubscription{} = rails_subscription) do
    Repo.delete(rails_subscription)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking rails_subscription changes.

  ## Examples

      iex> change_rails_subscription(rails_subscription)
      %Ecto.Changeset{source: %RailsSubscription{}}

  """
  def change_rails_subscription(%RailsSubscription{} = rails_subscription) do
    rails_subscription_changeset(rails_subscription, %{})
  end

  defp rails_subscription_changeset(%RailsSubscription{} = rails_subscription, attrs) do
    rails_subscription
    |> cast(attrs, [:first_name, :last_name, :gender, :email])
    |> validate_required([:first_name, :last_name, :gender, :email])
  end
end
