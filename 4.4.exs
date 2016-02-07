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
end

