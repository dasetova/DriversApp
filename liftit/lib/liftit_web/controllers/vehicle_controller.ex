defmodule LiftitWeb.VehicleController do
    use LiftitWeb, :controller
    alias Liftit.Repo
    alias Liftit.Models.{Owner,Vehicle,VehicleType}
    alias Ecto.Changeset
    import Ecto.Query

    def index(conn, _params) do
        query = 
            from v in Vehicle,
            join: o in assoc(v, :owner),
            join: vt in assoc(v, :vehicle_type),
            select: %{id: v.id, brand: v.brand, plate: v.plate, model: v.model, owner_name: o.full_name, type_description: vt.description}
        vehicles = 
            query
            |> Repo.all()
            |> Enum.map(fn(vehicle) -> struct(Vehicle,vehicle) end)
        render conn, "index.html", vehicles: vehicles
    end

    def new(conn, _params) do
        changeset = Vehicle.changeset(%Vehicle{}, %{})
        send_render(conn, "new.html", changeset: changeset)
    end

    def create(conn, %{"vehicle" => vehicle_params}) do
        owner = Liftit.Repo.get!(Owner, Map.get(vehicle_params,"owner",[]))
        vehicle_type = Liftit.Repo.get!(VehicleType, Map.get(vehicle_params,"vehicle_type",[]))
        %Vehicle{}
        |> Vehicle.changeset(vehicle_params)
        |> Changeset.put_assoc(:owner, owner)
        |> Changeset.put_assoc(:vehicle_type, vehicle_type)
        |> Repo.insert()
        |> case do
            {:ok, vehicle} ->
            conn
            |> put_flash(:info, "Vehicle created successfully.")
            |> redirect(to: vehicle_path(conn, :index))

            {:error, %Ecto.Changeset{} = changeset} ->
            conn
            |> put_flash(:error, "Can't save vehicle.")
            |> send_render("new.html", changeset: changeset)
        end
        
    end

    def show(conn, %{"id" => id}) do
        vehicle = Repo.get!(Vehicle, id) |> Repo.preload(:owner) |> Repo.preload(:vehicle_type)
        render(conn, "show.html", vehicle: vehicle)
    end

    def edit(conn, %{"id" => id}) do
        vehicle = Repo.get!(Vehicle, id) |> Repo.preload(:owner) |> Repo.preload(:vehicle_type)
        changeset = Vehicle.changeset(vehicle, %{})
        send_render(conn, "edit.html", [changeset: changeset, vehicle: vehicle])
    end

    def update(conn, %{"id" => id, "vehicle" => vehicle_params}) do
        vehicle = Repo.get!(Vehicle, id) |> Repo.preload(:owner) |> Repo.preload(:vehicle_type)
        owner = Liftit.Repo.get!(Owner, Map.get(vehicle_params,"owner_id",[]))
        vehicle_type = Liftit.Repo.get!(VehicleType, Map.get(vehicle_params,"vehicle_type_id",[]))
        
        vehicle
        |> Vehicle.changeset(vehicle_params)
        |> Changeset.put_assoc(:owner, owner)
        |> Changeset.put_assoc(:vehicle_type, vehicle_type)
        |> Repo.update()
        |> case do
            {:ok, vehicle} ->
            conn
            |> put_flash(:info, "Vehicle updated successfully.")
            |> redirect(to: vehicle_path(conn, :show, vehicle))
        end
    end

    def delete(conn, %{"id" => id}) do
        vehicle = Repo.get!(Vehicle, id)
        {:ok, _vehicle} = Repo.delete(vehicle)
        conn
        |> put_flash(:info, "Vehicle deleted successfully.")
        |> redirect(to: vehicle_path(conn, :index))
    end

    @doc """
    Necesario para realizar el envio de las listas de owners y vehicles_types
    a las vistas de New y Edit
    """
    defp send_render(conn, template, args) do
        owners = Repo.all(Owner)
        vehicles_types = Repo.all(VehicleType)
        render(conn, template, Keyword.merge([conn: conn, owners: owners, vehicles_types: vehicles_types], args))
    end
    

end