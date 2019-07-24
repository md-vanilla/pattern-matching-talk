defmodule CheckTree do
  # https://hexdocs.pm/elixir/master/guards.html#defining-custom-guard-expressions
  # the suggested way to write a custom guard.
  defguard is_not_tree(value) when 'tree' != value

  # not recommended way of writing a custom gaurd.
  defmacro is_tree(value) do
    quote do
      'tree' == unquote(value)
    end
  end
end
