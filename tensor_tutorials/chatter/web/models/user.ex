defmodule Chatter.User do
  use Chatter.Web, :model

  schema "users" do
    field :email, :string
    field :encrypt_pass, :string
     #virtual means it's not in the database
    field :password, :string, virtual: true

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :password])
    |> validate_required([:email, :encrypt_pass])
    |> unique_constraint(:email)
  end
end
