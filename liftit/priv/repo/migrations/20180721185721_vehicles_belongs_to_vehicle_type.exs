defmodule Liftit.Repo.Migrations.VehiclesBelongsToVehicleType do
  use Ecto.Migration

  def change do
    alter table (:vehicles) do
      add :vehicle_type_id, references(:vehicles_types)
    end
  end
end
