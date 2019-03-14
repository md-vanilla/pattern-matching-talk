defmodule MatcherTest do
  use ExUnit.Case
  doctest Matcher

  test "greets the world" do
    assert Matcher.hello() == :world
  end
end
