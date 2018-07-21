defmodule Liftit.Repo.Migrations.CreateOwner do
  use Ecto.Migration

  def change do
    create table (:owners) do
      add :full_name, :string
      add :address, :string
      add :phone_number, :string
    end

  end
end
