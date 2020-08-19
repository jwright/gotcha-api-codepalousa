defmodule GotchaWeb.GraphQL.Schema do
  use Absinthe.Schema

  import_types(GotchaWeb.GraphQL.Schema.Types)

  query do
    field :arenas, list_of(:arena) do
      resolve(&GotchaWeb.GraphQL.Resolvers.Arenas.nearby/3)
    end
  end
end
