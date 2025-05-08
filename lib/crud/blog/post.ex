defmodule Crud.Blog.Post do
  @moduledoc """
  Ecto schema module representing a blog post.
  This module represents a blog post which has a title and a body
  mapped to the posts table.
  """
  use Ecto.Schema
  import Ecto.Changeset

  @type t :: %__MODULE__{
    id: integer() | nil,
    title: String.t(),
    body: String.t(),
    inserted_at: NaiveDateTime.t() | nil,
    updated_at: NaiveDateTime.t() | nil
  }

  schema "posts" do
    field :title, :string
    field :body, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  @spec changeset(%__MODULE__{}, map()) :: Ecto.Changeset.t()
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :body])
    |> validate_required([:title, :body])
  end
end
