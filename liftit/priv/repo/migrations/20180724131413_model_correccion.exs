defmodule Liftit.Repo.Migrations.ModelCorreccion do
  use Ecto.Migration

  def change do
    alter table (:owners) do
      add :identificacion_number, :string
      add :age, :integer
      add :email, :string
    end
    
    alter table (:vehicles) do
      remove :model_year
    end
  end
end
