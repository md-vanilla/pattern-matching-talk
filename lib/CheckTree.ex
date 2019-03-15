defmodule CheckTree do
  # https://hexdocs.pm/elixir/master/guards.html#defining-custom-guard-expressions
  # the suggested way to write a custom guard.
  defguard is_not_tree(number) when 'tree' != number

  # not recommended way of writing a custom gaurd.
  defmacro is_tree(number) do
    quote do
      'tree' == unquote(number)
    end
  end
end
