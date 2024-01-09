defmodule Greeter do
  defp get_name do
    IO.gets("What's your name? \n")
  end

  def greet do
    answer = get_name()

    case answer do
      "" -> IO.puts("Fine, don't answer. Hello, World!")
      _ -> IO.puts("Hello, #{answer}!")
    end
  end
end


Greeter.greet
