defmodule GotchaWeb.GraphQL.Schema do
  use Absinthe.Schema

  query do
    field :areanas, list_of(:string)
  end
end
