defmodule Benchmark do
  # map_fun = fn i -> [i, i * i] end
  #
  # inputs = %{
  #   "small list" => Enum.to_list(1..100),
  #   "medium list" => Enum.to_list(1..10_000),
  #   "large list" => Enum.to_list(1..1_000_000)
  # }
  #
  # Benchee.run(
  #   %{
  #     "flat_map" => fn list -> Enum.flat_map(list, map_fun) end,
  #     "map.flatten" => fn list -> list |> Enum.map(map_fun) |> List.flatten() end
  #   },
  #   inputs: inputs
  # )

  @spec sum_times(integer) :: string
  def sum_times(a) do
    [1, 2, 3]
    |> Enum.map(fn el -> el * a end)
    |> Enum.sum()
    |> round
  end
end
