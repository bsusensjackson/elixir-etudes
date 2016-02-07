defmodule Powers do
import Kernel, except: [raise: 2, raise: 3]

  def raise(x, n) do
    cond do
      n == 0 -> 1
      n == 1 -> x
      n > 1 ->
        raise(x, n, 1)
      n < 0 ->
        1.0 / raise(x, -n)
    end
  end

  def raise(x, n, accumulator) do
    cond do
      n == 0 -> accumulator
      n > 0 -> raise(x, n - 1, x * accumulator)
    end
  end

  def nth_root(x, n) do
    nth_root(x, n, x / 2.0)
  end

  def nth_root(x, n, a) do
    f = (raise(a, n) - x)
    f_prime = (n * raise(a, n - 1) )
    next =  a - (f / f_prime)
    change = abs(next - a)
    cond do
      change <= ( 0.0000000001 ) -> next
      true -> nth_root(x, n, next)
    end
  end
end

