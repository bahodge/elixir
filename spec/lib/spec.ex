defmodule Spec do
  defstruct first: nil, last: nil

  @typedoc """
      Type that represents Examples struct with :first as integer and :last as integer.
  """
  @type t(first, last) :: %Spec{first: first, last: last}
  @type t :: %Spec{first: integer, last: integer}

  @spec sum_times(integer, Spec.t()) :: integer
  def sum_times(a, params) do
    for i <- params.first..params.last do
      i
    end
    |> Enum.map(fn el -> el * a end)
    |> Enum.sum()
    |> round
  end
end
