defmodule ExampleTest do
  @moduledoc """
  Documentation for `ExampleTest`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> ExampleTest.hello()
      :world

  """

  @spec hello() :: {:ok, String.t()}
  def hello do
    {:ok, "world"}
  end
end
