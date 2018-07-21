defmodule Liftit.Repo.Migrations.VehiclesBelongsToOwner do
  use Ecto.Migration

  def change do
    alter table (:vehicles) do
      add :owner_id, references(:owners)
    end
  end
end
