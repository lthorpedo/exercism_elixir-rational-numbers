defmodule RationalNumbers do
  @type rational :: {integer, integer}

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
    {one, two}
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
    {one, two}
  end

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply(a, b) do
    r1 = a[0] * b[0]
    r2 = a[1] * b[1]
    {r1, r2}
  end

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(num :: rational, den :: rational) :: rational
  def divide_by(num, den) do
    r1 = num[0] * den[1]
    r2 = den[0] * num[1]
    {r1, r2}
  end

  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs(a) do
  end

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(a :: rational, n :: integer) :: rational
  def pow_rational(a, n) do
  end

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(x, n) do
  end

  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(a :: rational) :: rational
  def reduce(a) do
  end
end
