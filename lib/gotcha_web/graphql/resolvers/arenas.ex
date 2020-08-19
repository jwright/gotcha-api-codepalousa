defmodule GotchaWeb.GraphQL.Resolvers.Arenas do
  alias Gotcha.{Arena, Repo}

  def nearby(parent, args, resolution) do
    {:ok, Arena |> Repo.all()}
  end
end
