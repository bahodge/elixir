defmodule ExampleTestTest do
  use ExUnit.Case
  doctest ExampleTest

  test "greets the world" do
    assert ExampleTest.hello() == :world
  end
end
