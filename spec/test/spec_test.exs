defmodule SpecTest do
  use ExUnit.Case
  doctest Spec

  test "greets the world" do
    assert Spec.hello() == :world
  end
end
