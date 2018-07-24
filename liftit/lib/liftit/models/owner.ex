defmodule Liftit.Models.Owner do
    use Ecto.Schema
    import Ecto.Changeset
    alias Liftit.Models.Owner

    schema "owners" do
        field :identificacion_number, :string
        field :full_name, :string
        field :age, :integer
        field :address, :string
        field :phone_number, :string
        field :email, :string
        has_many(:vehicles, Liftit.Models.Vehicle, on_delete: :delete_all)
    end

    def changeset(%Owner{} = owner, attrs) do
        owner
        |> cast(attrs, [:identificacion_number,:full_name, :age, :address, :phone_number, :email])
        |> validate_required([:identificacion_number,:full_name, :age, :address, :phone_number, :email])
        |> validate_length(:full_name, max: 50)
        |> validate_number(:age, greater_than: 17)
        |> validate_format(:email, ~r/@/)
        |> unique_constraint(:identification_number)
    end
end