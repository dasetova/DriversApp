defmodule LiftitWeb.Controllers.OwnerControllerTest do
    use LiftitWeb.ConnCase
    alias Liftit.Repo
    alias Liftit.Models.Owner

    test "index/2 responds with all owners", %{conn: conn} do
        conn = get(conn, owner_path(conn, :index))
        assert html_response(conn, 200) =~ "Owners List"
    end

    describe "new Owner" do
        test "show/2 responds new owner form", %{conn: conn} do
        conn = get(conn, owner_path(conn, :new))
        assert html_response(conn, 200) =~ "Add new owner"
        end
    end

    describe "create owner" do
        test "create/2 creates a new owner and redirect to index", %{conn: conn, valid_attrs: valid_attrs} do
        conn = post(conn, owner_path(conn, :create), owner: valid_attrs)
        assert %{id: id} = redirected_params(conn)
        assert redirected_to(conn) == owner_path(conn, :index)
        end
    end

end