defmodule Mix.Tasks.Matcher do
  use Mix.Task

  @shortdoc "runs the handle match  function many different ways."
  def matcher( input ) do
    Matcher.handle_match(input)
    |> IO.inspect()
  end

  def run(_) do
    matcher(4)
    matcher(5.2)
    matcher(5)
    matcher({})
    matcher(%{})
    matcher([1 | [ 2, 3] ])
    matcher({ 3, [1 | [ 2, 3] ]})
  end

end
