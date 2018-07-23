defmodule Liftit.Models.VehicleTest do
    use Liftit.DataCase
    
    alias Liftit.Models.Vehicle

    @valid_attrs %{plate: "XYZ123", brand: "Chevrolet", model: "2018"}
    @invalid_attrs %{}

    test "changeset with valid attributes" do
        changeset = Vehicle.changeset(%Vehicle{}, @valid_attrs)
        assert changeset.valid?
    end

    test "changeset with invalid attributes" do
        changeset = Vehicle.changeset(%Vehicle{}, @invalid_attrs)
        refute changeset.valid?
    end

end