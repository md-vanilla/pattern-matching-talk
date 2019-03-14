defmodule Matcher do
  @moduledoc """
  Documentation for Matcher.

  https://hexdocs.pm/elixir/Kernel.html
  # is_atom(term) is_binary(term) is_bitstring(term) is_boolean(term)
  # is_float(term) is_function(term) is_function(term, arity)
  # is_integer(term) is_list(term) is_map(term) is_nil(term) is_number(term)
  # is_pid(term) is_port(term) is_reference(term) is_tuple(term)

  https://hexdocs.pm/elixir/guards.html
  # Guards are a way to augment pattern matching with more complex checks.
  matcher function implements a bunch of different gaurds.
  """
  def handle_match(number) when is_integer(number) and rem(number, 2) == 0, do: 'number was not dividable by 2'

  def handle_match(term) when is_integer(term), do: { term, 'is integer'}
  def handle_match(term) when is_float(term), do: { term, 'converted to integer:', round(term) }
  def handle_match(term) when is_integer(term) or is_float(term), do: 'matches on integer float is also true'
  def handle_match(val) when map_size(val) == 0 when tuple_size(val) == 0, do: 'an empty map or tuple was found!'

  @doc """
    the tuples and lists that have content have not been matched allowing the below functions to execute.
  """
  def handle_match(cool_list = [a, b, c] = [head | tail ] = [1,2,3]), do: { 'cool_list:', cool_list, 'a:', a, 'b:', b, 'c:', c, 'head:', head, 'tail:', tail}
  def handle_match(cool_tuple = { s, [a, b, c] = [head | tail ] = [1,2,3] }), do: { s, a, b, c, head, tail, cool_tuple}
  # matcher({x, y, [1, 2, 3]})

end
