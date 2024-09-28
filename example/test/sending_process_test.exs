defmodule SendingProcessTest do
  use ExUnit.Case

  test "receives ping" do
    SendProcess.run(self())
    assert_received :ping
  end
end
