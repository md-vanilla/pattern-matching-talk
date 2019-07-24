defmodule CheckTree do
  # https://hexdocs.pm/elixir/master/guards.html#defining-custom-guard-expressions
  # the suggested way to write a custom guard.
  defguard is_not_tree(strValue) when 'tree' != strValue

  # not recommended way of writing a custom gaurd.
  defmacro is_tree(strValue) do
    quote do
      'tree' == unquote(strValue)
    end
  end
end
