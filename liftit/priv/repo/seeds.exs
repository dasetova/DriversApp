defmodule Liftit.DatabaseSeeder do
  alias Liftit.Repo
  alias Liftit.Models.VehicleType

  def insert_vehicles_types do
    Repo.insert! %VehicleType{
      description: "NHR"
    }
  end

  def clear do
    Repo.delete_all()
  end
end
