defmodule Amooma.Interim.RailsSubscription do
  use Ecto.Schema

  schema "interim_rails_subscriptions" do
    field :email, :string
    field :first_name, :string
    field :gender, :string
    field :last_name, :string

    timestamps()
  end
end
