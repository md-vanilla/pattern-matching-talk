defmodule Mix.Tasks.Matcher do
  use Mix.Task

  @shortdoc "runs the handle match  function many different ways."
  def run(_) do
    Matcher.handle_match(5.2)
    Matcher.handle_match(5)
    Matcher.handle_match({})
    Matcher.handle_match(%{})
    Matcher.handle_match([1 | [ 2, 3] ])
    Matcher.handle_match({ 3, [1 | [ 2, 3] ]})
  end

end
