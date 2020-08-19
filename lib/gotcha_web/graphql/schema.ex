defmodule GotchaWeb.GraphQL.Schema do
  use Absinthe.Schema

  import_types(GotchaWeb.GraphQL.Schema.Types)

  query do
    field :arenas, list_of(:arena) do
      arg(:latitude, non_null(:float), description: "The latitude used for the center point")
      arg(:longitude, non_null(:float), description: "The longitude used for the center point")

      arg(:radius, :integer,
        default_value: 25,
        description:
          "The number of miles to use for the radius to find nearby arenas. Defaults to 25 miles."
      )

      resolve(&GotchaWeb.GraphQL.Resolvers.Arenas.nearby/3)
    end
  end
end
