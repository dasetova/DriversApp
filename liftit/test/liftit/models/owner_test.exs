defmodule Liftit.Models.OwnerTest do
    use Liftit.DataCase
    
    alias Liftit.Models.Owner

    @valid_attrs %{full_name: "Daniel Torres", address: "Calle falsa 123", phone_number: "5874521"}
    @invalid_attrs %{}

    test "changeset with valid attributes" do
        changeset = Owner.changeset(%Owner{}, @valid_attrs)
        assert changeset.valid?
    end

    test "changeset with invalid attributes" do
        changeset = Owner.changeset(%Owner{}, @invalid_attrs)
        refute changeset.valid?
    end

end