defmodule Mix.Tasks.Matcher do
  use Mix.Task
  ## http://blog.plataformatec.com.br/2015/10/mocks-and-explicit-contracts/
  @shortdoc "runs the handle match  function many different ways."
  def matcher( input ) do
    PatternMatcher.handle_match(input)
    |> IO.inspect()
  end

  def recursive_function_matcher(f) do
    f.()
    |> IO.inspect()
  end
  def run(_) do
    letters = Enum.map(?a..?z, fn x -> <<x::utf8>> end)
    numbers = Enum.to_list(0..10_000)
    list = Enum.shuffle(letters ++ numbers)
    matcher('tree')
    matcher('building')
    matcher(4)
    matcher(5.2)
    matcher(5)
    matcher({})
    matcher(%{})
    matcher([1 | [ 2, 3] ])
    matcher({ 3, [1 | [ 2, 3] ]})
    recursive_function_matcher(fn -> Recursion.sum_numbers1(list) end)
    recursive_function_matcher(fn -> Recursion.double_numbers3(list) end)

    Benchee.run(
      %{
        "Enum.filter/2 and Enum.reduce/3" => fn -> Recursion.sum_numbers1(list) end,
        "Body-recursive" => fn -> Recursion.sum_numbers2(list) end,
        "Tail-recursive" => fn -> Recursion.sum_numbers3(list) end,

        "Double numbers Enum.filter/2 and Enum.map/1 -> x * 2" => fn -> Recursion.double_numbers1(list) end,
        "Double numbers Body-recursive" => fn -> Recursion.double_numbers2(list) end,
        "Double numbers Tail-recursive" => fn -> Recursion.double_numbers3(list) end
      },
      time: 10,
      # https://github.com/bencheeorg/benchee/wiki/Parallel-Benchmarking
      parallel: 3   ,
      memory_time: 2
    )
  end




end
