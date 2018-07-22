defmodule Liftit.Models.Owner do
    use Ecto.Schema
    import Ecto.Changeset
    alias Liftit.Models.Owner

    schema "owners" do
        field :full_name, :string
        field :address, :string
        field :phone_number, :string
        has_many(:vehicles, Liftit.Models.Vehicle, on_delete: :delete_all)
    end

    def changeset(%Owner{} = owner, attrs) do
        owner
        |> cast(attrs, [:full_name, :address, :phone_number])
        |> validate_required([:full_name, :address, :phone_number])
    end
end