defmodule StatefulDatabaseServer do
  def start do
    spawn(fn ->
      connection = :random.uniform(1000)
      loop(connection)
    end)
  end

  defp loop(connection) do
    receive do
      {:run_query, from_pid, query_def} ->
        query_result = run_query(connection, query_def)
        send(from_pid, {:query_result, query_result})
    end

    loop(connection)
  end

  def run_async(server_pid, query_def) do
    send(server_pid, {:run_query, self(), query_def})
  end

  defp run_query(connection, query_def) do
    :timer.sleep(2000)
    "Connection: #{connection} ->  Result: #{query_def}"
  end

  def get_result do
    receive do
      {:query_result, result} -> result
    after
      5000 -> {:error, :timeout}
    end
  end
end