defmodule Liftit.Repo.Migrations.CreateVehicles do
  use Ecto.Migration

  def change do
    create table(:vehicles) do
      add :plate, :string
      add :brand, :string
      add :model_year, :string
      add :model, :string  
    end
    
  end
end
