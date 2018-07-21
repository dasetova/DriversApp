defmodule Liftit.Models.Vehicle do
    use Ecto.Schema

    schema "vehicles" do
        field :plate, :string
        field :brand, :string
        field :model_year, :string
        field :model, :string
        belongs_to :owner, Liftit.Models.Owner
        belongs_to :vehicle_type, Liftit.Models.VehicleType
    end
    
end