defmodule Liftit.Models.Owner do
    use Ecto.Schema

    schema "owners" do
        field :full_name, :string
        field :address, :string
        field :phone_number, :string
        has_many :vehicles, Liftit.Models.Vehicle
    end
end