defmodule RationalNumbers do
  @type rational :: {integer, integer}

  import Math

  @doc """
  Add two rational numbers
  """
  @spec add(r_one :: rational, r_two :: rational) :: rational
  def add(r_one, r_two) do
    # {1, 2}, {2, 3} == {7, 6}
    a1 = elem(r_one, 0)
    b1 = elem(r_one,1)
    a2 = elem(r_two, 0)
    b2 = elem(r_two,1)
    one = (a1 * b2 + a2 * b1)
    two = b1 * b2
    {one, two} |> reduce
  end

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(r_one :: rational, r_two :: rational) :: rational
  def subtract(r_one, r_two) do
    a1 = elem(r_one, 0)
    b1 = elem(r_one,1)
    a2 = elem(r_two, 0)
    b2 = elem(r_two,1)
    one = (a1 * b2 - a2 * b1)
    two = b1 * b2
    {one, two} |> reduce
  end

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply(a, b) do
    r1 = elem(a,0) * elem(b,0)
    r2 = elem(a,1) * elem(b,1)
    {r1, r2} |> reduce
  end

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(num :: rational, den :: rational) :: rational
  def divide_by(num, den) do
    r1 = elem(num,0) * elem(den,1)
    r2 = elem(den,0) * elem(num,1)
    {r1, r2} |> reduce
  end

  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs(a) do
    {Kernel.abs(elem(a, 0)), Kernel.abs(elem(a, 1))} |> reduce
  end

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(a :: rational, n :: integer) :: rational
  def pow_rational(a, n) do
    cond do
      n >= 0 ->
        r1 = elem(a,0) |> :math.pow(n) |> round
        r2 = elem(a,1) |> :math.pow(n) |> round
        {r1, r2} |> reduce
      n <= 0 ->
        r1 = elem(a,1) |> :math.pow(Kernel.abs(n)) |> round
        r2 = elem(a,0) |> :math.pow(Kernel.abs(n)) |> round
        {r1, r2} |> reduce
    end
  end

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(x, n) do
    # root = 1 / elem(n,1)
    :math.pow(x, elem(n,0)) |> Math.nth_root(elem(n,1))
  end

  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(a :: rational) :: rational
  def reduce(a) do
    a1 = elem(a,0)
    b1 = elem(a,1)
    common_den = Math.gcd(a1,b1)
    cond do
      a1 == 0 -> {0,1}
      common_den > 1 ->
        r1 = a1 / common_den |> round
        r2 = b1 / common_den |> round
        {r1, r2} |> reduce
      a1 < 0 && b1 < 0 ->
        {Kernel.abs(a1), Kernel.abs(b1)}
      a1 > 0 && b1 < 0 ->
        {a1 * -1, Kernel.abs(b1)}
      true -> {a1,b1}
    end
  end
end
