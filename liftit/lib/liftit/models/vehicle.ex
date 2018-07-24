defmodule Liftit.Models.Vehicle do
    use Ecto.Schema
    import Ecto.Changeset
    alias Liftit.Repo
    alias Liftit.Models.{Owner, Vehicle, VehicleType}

    schema "vehicles" do
        field :plate, :string
        field :brand, :string
        field :model, :string
        belongs_to(:owner, Owner, on_replace: :nilify)
        belongs_to(:vehicle_type, VehicleType, on_replace: :nilify)
    end

    def changeset(%Vehicle{} = vehicle, attrs) do
        vehicle
        |> Repo.preload([:owner, :vehicle_type])
        |> cast(attrs, [:plate, :brand, :model])
        |> validate_required([:plate, :brand, :model])
        |> validate_format(:plate, ~r/[A-Z]{3}\d{3}/)#Placas alfanumericas, primeras 3 letras y ultimas 3 numeros
        |> validate_format(:model, ~r/([1][9][8-9][0-9])|([2][0][0-1][0-8])/) #Modelos validos de 1980 a 2018
        |> unique_constraint(:plate) #Placa única
    end
    
end