defmodule Gotcha.ArenaTest do
  use ExUnit.Case, async: true

  import Gotcha.Factory

  alias Gotcha.{Arena, Repo}

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Repo)
  end

  describe "validations" do
    test "location name is required" do
      changeset = Arena.build(%{location_name: ""})

      refute changeset.valid?

      assert changeset.errors[:location_name] == {"can't be blank", [validation: :required]}
    end
  end

  describe ".near" do
    test "returns all arenas within a specific point and radius" do
      arena1 = insert(:arena, latitude: 40.706877, longitude: -74.011265)
      insert(:arena, latitude: 41.651031, longitude: -83.541939)
      arena2 = insert(:arena, latitude: 40.712742, longitude: -74.013382)

      nearby = Arena.near(40.7087676, -74.0185012, 25)

      assert Enum.map(nearby, & &1.id) == [arena1.id, arena2.id]
    end
  end
end
