defmodule Gotcha.ArenaTest do
  use ExUnit.Case, async: true

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
end
