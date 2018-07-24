defmodule Liftit.Models.OwnerTest do
    use Liftit.DataCase
    
    alias Liftit.Models.Owner

    @valid_attrs %{identificacion_number: "123456789", full_name: "Daniel Torres", age: 27, address: "Calle falsa 123", phone_number: "5874521", email: "dasetova@gmail.com"}
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