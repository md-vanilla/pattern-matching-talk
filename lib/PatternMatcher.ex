import MyInteger, only: [is_even: 1]
import CheckTree, only: [is_tree: 1, is_not_tree: 1]
defmodule PatternMatcher do
  @moduledoc """
  Documentation for Matcher.

  https://hexdocs.pm/elixir/Kernel.html#summary
  Not included here,  is all of the functions from the kernal file.
  Below are listed all of the tools for gaurds:

  # is_atom(term) is_binary(term) is_bitstring(term) is_boolean(term)
  # is_float(term) is_function(term) is_function(term, arity)
  # is_integer(term) is_list(term) is_map(term) is_nil(term) is_number(term)
  # is_pid(term) is_port(term) is_reference(term) is_tuple(term)

  # length(list) map_size(map) node() node(arg) not(value) left or right
  # rem(dividend, divisor) round(number) self() tl(list) trunc(number) tuple_size(tuple)

  # !=, !==, *, +, -, /, <, <=, >, >=, +value, -value,
  # abs(number), and, binary_part(binary, start, length), bit_size(bitstring)
  # byte_size(bitstring), ceil(number), div(dividend, divisor), elem(tuple, index)
  # floor(number), hd(list), in,
  https://hexdocs.pm/elixir/guards.html
  # Guards are a way to augment pattern matching with more complex checks.
  matcher function implements a bunch of different gaurds.

  """
  def handle_match(number) when is_even(number), do: "number #{number} was divisable by 2"
  def handle_match(number) when is_tree(number), do: 'a --#{number}-- was found in the forest'

  def handle_match(term) when is_integer(term), do: { term, 'is integer'}
  def handle_match(term) when is_float(term), do: { term, 'converted to integer:', round(term) }
  def handle_match(term) when is_integer(term) or is_float(term), do: 'matches on integer float is also true'
  def handle_match(val) when map_size(val) == 0 when tuple_size(val) == 0, do: 'an empty map or tuple was found!'

  @doc """
    the tuples and lists that have content have not been matched allowing the below functions to execute.

    Additional things that can be matched: source (https://hexdocs.pm/elixir/Kernel.html)

    Built-in types
    Structs, Atom, Integer, Float, Tuple, List, Map, Function, Process, Port, Bitstring, Reference

    Elixir also provides other data types:
    Date, DateTime, Exceptions, Mapsets, keyword, Range, Regex, Time, URI, Version.

    Additional Datatypes:
    Streams

    Unsure if you can match the following:
    System modules, Protocols, Inlining i.e: &:erlang.is_atom/1,

    Agent, Application, GenServer, Registry, Supervisor, Task, Task.Supervisor

  """



  def handle_match(cool_list = [a, b, c] = [head | tail ] = [1,2,3]), do: { 'cool_list:', cool_list, 'a:', a, 'b:', b, 'c:', c, 'head:', head, 'tail:', tail}
  def handle_match(cool_tuple = { s, [a, b, c] = [head | tail ] = [1,2,3] }), do: { s, a, b, c, head, tail, cool_tuple}
  # matcher({x, y, [1, 2, 3]})

  def handle_match(number) when is_not_tree(number), do: 'string found but --#{number}-- was not found in the forest'

end
