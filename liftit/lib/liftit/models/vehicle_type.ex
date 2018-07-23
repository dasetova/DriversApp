defmodule Liftit.Models.VehicleType do
    use Ecto.Schema

    schema "vehicles_types" do
        field :description, :string
        has_many(:vehicles, Liftit.Models.Vehicle, on_delete: :delete_all)
    end

    
end