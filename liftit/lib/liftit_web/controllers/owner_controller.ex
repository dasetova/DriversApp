defmodule LiftitWeb.OwnerController do
    user LiftitWeb, :controller
    def new(conn, _params) do
        alias Liftit.Models.Owner
        changeset = Owner.changeset(%Owner, %{})
        render conn, "new.html", changeset: changeset
    end

end