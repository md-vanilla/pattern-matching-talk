defmodule RecursionTest do
  use ExUnit.Case
  doctest PatternMatcher

  setup_all do
    list = [9465, 7262, 9989, 263, 9028, 3891, 2080, 5790, 2113, 4310, 5513, 9550, 5065,
             2705, 3995, 3264, 4275, 7923, 9335, 8671, 1657, 7924, 8517, 3776, 5219, 4938,
             7441, 8158, 2702, 5701, 9619, 1903, 618, 727, 8807, 6373, 9369, 1457, 8418,
             5496, 1037, 1396, 3039, 951, 8124, 1841, 5202, 7572, 600, 1811]
    doubled_list = [18930, 14524, 19978, 526, 18056, 7782, 4160, 11580, 4226, 8620,
             11026, 19100, 10130, 5410, 7990, 6528, 8550, 15846, 18670, 17342,
             3314, 15848, 17034, 7552, 10438, 9876, 14882, 16316, 5404, 11402,
             19238, 3806, 1236, 1454, 17614, 12746, 18738, 2914, 16836, 10992,
             2074, 2792, 6078, 1902, 16248, 3682, 10404, 15144, 1200, 3622]
    list_sum = 254880
    {:ok, list: list, list_sum: 254880, doubled_list: doubled_list}
  end
  describe "tail call recursion using pattern matching:" do

    test "sum numbers", state do
      assert Recursion.sum_numbers1(state[:list]) == state[:list_sum]
    end
    test "double list", state do
      assert Recursion.double_numbers1(state[:list]) == state[:doubled_list]
    end
  end

  describe "body recursion using pattern matching:" do
    test "sum numbers", state do
      assert Recursion.sum_numbers2(state[:list]) == state[:list_sum]
    end
    test "double list", state do
      assert Recursion.double_numbers2(state[:list]) == state[:doubled_list]
    end
  end

  describe "without pattern matching:" do
    test "sum numbers", state do
      assert Recursion.sum_numbers3(state[:list]) == state[:list_sum]
    end
    test "double list", state do
      assert Recursion.double_numbers3(state[:list]) == state[:doubled_list]
    end
  end

end
