defmodule DatabaseServer do
  def start do
    spawn(&loop/0)
  end

  def run_asyn(server_pid, query_def) do
    send(server_pid, {:run_query, self(), query_def})
  end

  defp loop do
    receive do
      {:run_query, caller, query_def} ->
        send(caller, {:query_result, run_query(query_def)})
    end
  end

  defp run_query(query_def) do
    :timer.sleep(2000)
    "#{query_def} result"
  end


end