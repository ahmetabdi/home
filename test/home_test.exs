defmodule HomeTest do
  use ExUnit.Case
  doctest Home

  test "greets the world" do
    assert Home.hello() == :world
  end
end
