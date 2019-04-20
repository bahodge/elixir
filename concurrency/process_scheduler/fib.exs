defmodule Scheduler do
  def run(num_processes, module, func, to_calculate) do
    1..num_processes
    |> Enum.map(fn _ -> spawn(module, func, [self()]) end)
    |> schedule_processes(to_calculate, [])
  end

  defp schedule_processes(processes, queue, results) do
    receive do
      {:ready, pid} when length(queue) > 0 ->
        [next | tail] = queue
        send(pid, {:fib, next, self})
        schedule_processes(processes, tail, results)

      {:ready, pid} ->
        send(pid, {:shutdown})

        if length(processes) > 1 do
          schedule_processes(List.delete(processes, pid), queue, results)
        else
          Enum.sort(results, fn {n1, _}, {n2, _} -> n1 <= n2 end)
        end

      {:answer, number, result, _pid} ->
        schedule_processes(processes, queue, [{number, result} | results])
    end
  end
end

defmodule FibSolver do
  def fib(scheduler) do
    send(scheduler, {:ready, self()})

    receive do
      {:fib, n, client} ->
        send(client, {:answer, n, _fib_calc(n), self})
        fib(scheduler)

      {:shutdown} ->
        exit(:normal)
    end
  end

  defp _fib_calc(0), do: 0
  defp _fib_calc(1), do: 1
  defp _fib_calc(n), do: _fib_calc(n - 1) + _fib_calc(n - 2)
end

to_process = [37, 37, 37, 37, 37, 37]

Enum.each(1..100, fn num_processes ->
  {time, result} =
    :timer.tc(
      Scheduler,
      :run,
      [num_processes, FibSolver, :fib, to_process]
    )

  if num_processes == 1 do
    IO.puts(inspect(result))
    IO.puts("\n # time (s)")
  end

  :io.format("~2B         ~.2f~n", [num_processes, time / 1_000_000.0])
end)
