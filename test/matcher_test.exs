defmodule MatcherTest do
  use ExUnit.Case
  doctest Matcher

  describe "pattern matching visual example, change the shape of the data." do

    test "pattern match cool list" do
      assert Matcher.handle_match([1 | [ 2, 3] ]) == {'cool_list:', [1, 2, 3], 'a:', 1, 'b:', 2, 'c:', 3, 'head:', 1, 'tail:', [2, 3]}

    end
    test "pattern match a cool tuple" do
      assert Matcher.handle_match({ 3, [1 | [ 2, 3] ]}) == {3, 1, 2, 3, 1, [2, 3], {3, [1, 2, 3]}}
    end
  end

  describe "pattern matching gaurd examples" do

    test "pattern match float using a gaurd" do
      assert Matcher.handle_match(5.2) == {5.2, 'converted to integer:', 5}
    end
    test "pattern match integer using a gaurd" do
      assert Matcher.handle_match(5)  == {5, 'is integer'}
    end
    test "pattern match empty list" do
      assert Matcher.handle_match({}) == 'an empty map or tuple was found!'
    end
    test "pattern match empty map using a gaurd" do
      assert Matcher.handle_match(%{})  == 'an empty map or tuple was found!'
    end

  end
end
