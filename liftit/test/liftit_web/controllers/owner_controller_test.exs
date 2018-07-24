defmodule LiftitWeb.Controllers.OwnerControllerTest do
    use LiftitWeb.ConnCase
    alias Liftit.Repo
    alias Liftit.Models.Owner

    test "index/2 responds with all owners", %{conn: conn} do
        conn = get(conn, owner_path(conn, :index))
        assert html_response(conn, 200) =~ "Owners list"
    end

    describe "new Owner" do
        test "show/2 responds new owner form", %{conn: conn} do
        conn = get(conn, owner_path(conn, :new))
        assert html_response(conn, 200) =~ "Add new owner"
        end
    end

end