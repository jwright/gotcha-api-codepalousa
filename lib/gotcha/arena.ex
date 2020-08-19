defmodule Gotcha.Arena do
  use Gotcha.Query, module: __MODULE__

  schema "arenas" do
    field :city, :string
    field :latitude, :float
    field :location_name, :string
    field :longitude, :float
    field :state, :string
    field :street_addres1, :string
    field :street_address2, :string
    field :zip_code, :string

    timestamps()
  end

  @doc false
  def changeset(arena, attrs) do
    arena
    |> cast(attrs, [
      :location_name,
      :street_addres1,
      :street_address2,
      :city,
      :state,
      :zip_code,
      :longitude,
      :latitude
    ])
    |> validate_required([
      :location_name,
      :street_addres1,
      :city,
      :state,
      :zip_code,
      :longitude,
      :latitude
    ])
  end
end
