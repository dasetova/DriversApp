defmodule Liftit.Repo.Migrations.CreateVehiclesTypes do
  use Ecto.Migration

  def change do
    create table (:vehicles_types) do
      add :description, :string
    end
  end
end
