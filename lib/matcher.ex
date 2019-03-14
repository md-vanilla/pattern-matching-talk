defmodule Matcher do
  @moduledoc """
  Documentation for Matcher.
  """

  def handle_match( input ) do
    matcher(input)
    |> IO.inspect()
  end

  @doc """
  https://hexdocs.pm/elixir/Kernel.html
  # is_atom(term) is_binary(term) is_bitstring(term) is_boolean(term)
  # is_float(term) is_function(term) is_function(term, arity)
  # is_integer(term) is_list(term) is_map(term) is_nil(term) is_number(term)
  # is_pid(term) is_port(term) is_reference(term) is_tuple(term)

  https://hexdocs.pm/elixir/guards.html
  # Guards are a way to augment pattern matching with more complex checks.
  matcher function implements a bunch of different gaurds.
  """
  def matcher(number) when is_integer(number) and rem(number, 2) == 0, do: 'number was not dividable by 2'

  def matcher(term) when is_integer(term), do: { term, 'is integer'}
  def matcher(term) when is_float(term), do: { term, 'converted to integer:', round(term) }
  def matcher(term) when is_integer(term) or is_float(term), do: 'matches on integer float is also true'
  def matcher(val) when map_size(val) == 0 when tuple_size(val) == 0, do: 'an empty map or tuple was found!'

end
