defmodule Amooma.Repo.Migrations.CreateAmooma.Interim.RailsSubscription do
  use Ecto.Migration

  def change do
    create table(:interim_rails_subscriptions) do
      add :first_name, :string
      add :last_name, :string
      add :gender, :string
      add :email, :string

      timestamps()
    end

  end
end
