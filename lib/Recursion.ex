defmodule Recursion do
  # Sourced From: https://blog.appsignal.com/2019/03/19/elixir-alchemy-recursion.html?utm_source=twitter&utm_medium=BoostedBlogPost&utm_campaign=EArecursion_organicboost

  def sum_numbers1(list) do
    list
    |> Enum.filter(&is_number/1)
    |> Enum.reduce(0, fn n, sum -> n + sum end)
  end

  # 1 Normal body-recursion
  def sum_numbers2([head | tail]) when is_number(head), do: sum_numbers2(tail) + head
  def sum_numbers2([_head | tail]), do: sum_numbers2(tail)
  def sum_numbers2([]), do: 0

  # 1 Tail call optimization allows functions calling themselves without running into stack problems.
  def sum_numbers3(list) do
    do_sum_numbers3(list, 0)
  end

  # 2 It calls itself with the list's tail, and the head added to the accumulator.
  defp do_sum_numbers3([head | tail], sum) when is_number(head) do
    do_sum_numbers3(tail, sum + head)
  end

  # 3 This function could be removed if you know your input will be numbers.
  # 3 When the head is not a number, the third function head drops it by calling itself with the tail and the current accumulator, without changing anything.
  defp do_sum_numbers3([_head | tail], sum) do
    do_sum_numbers3(tail, sum)
  end

  # 4, list expended return sum of all first elements.
  defp do_sum_numbers3([], sum) do
    sum
  end

  ###### double an filter a list without pattern matching. #####
  def double_numbers1(list) do
    list
    |> Enum.filter(&is_number/1)
    |> Enum.map(fn n -> n * 2 end)
  end

  ###### double and filter a list with body call pattern matching. ######
  def double_numbers2([]) do
    []
  end

  def double_numbers2([head | tail]) when is_number(head) do
    [head * 2 | double_numbers2(tail)]
  end

  def double_numbers2([_head | tail]) do
    double_numbers2(tail)
  end

  ## larger over head ... passing the array as an accumulator... ####
  ## tail call provides no benefit. ####
  def double_numbers3(list) do
    list
    |> do_double_numbers3([])
    |> Enum.reverse()
  end

  defp do_double_numbers3([], acc) do
    acc
  end

  defp do_double_numbers3([head | tail], acc) when is_number(head) do
    do_double_numbers3(tail, [head * 2 | acc])
  end

  defp do_double_numbers3([_head | tail], acc) do
    do_double_numbers3(tail, acc)
  end
end
