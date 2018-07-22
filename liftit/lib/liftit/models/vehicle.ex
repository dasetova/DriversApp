defmodule Liftit.Models.Vehicle do
    use Ecto.Schema
    import Ecto.Changeset
    alias Liftit.Repo
    alias Liftit.Models.{Owner, Vehicle, VehicleType}

    schema "vehicles" do
        field :plate, :string
        field :brand, :string
        field :model_year, :string
        field :model, :string
        field :owner_name, :string, virtual: true
        field :type_description, :string, virtual: true
        belongs_to(:owner, Owner, on_replace: :nilify)
        belongs_to(:vehicle_type, VehicleType, on_replace: :nilify)
    end

    def changeset(%Vehicle{} = vehicle, attrs) do
        vehicle
        |> Repo.preload([:owner, :vehicle_type])
        |> cast(attrs, [:plate, :brand, :model_year, :model])
        |> validate_required([:plate, :brand, :model])
    end
    
end