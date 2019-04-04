defmodule Hello.Flows do
  @moduledoc """
  The Flows context.
  """

  import Ecto.Query, warn: false
  alias Hello.Repo

  alias Hello.Flows.Pin

  @doc """
  Creates a pin.

  ## Examples

      iex> create_pin(%{field: value})
      {:ok, %Pin{}}

      iex> create_pin(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_pin(attrs \\ %{}) do
    %Pin{}
    |> Pin.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking pin changes.

  ## Examples

      iex> pin_changeset(pin)
      %Ecto.Changeset{source: %Pin{}}

  """
  def pin_changeset(%Pin{} = pin, attrs \\ %{}) do
    Pin.changeset(pin, attrs)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking and validating pin msisdn changes.

  ## Examples

      iex> pin_msisdn_changeset(pin)
      %Ecto.Changeset{source: %Pin{}}

  """
  def pin_msisdn_changeset(%Pin{} = pin, attrs \\ %{}) do
    Pin.changeset_msisdn(pin, attrs)
  end
end
