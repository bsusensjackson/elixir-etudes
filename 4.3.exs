defmodule Powers do
import Kernel, except: [raise: 2]

  def raise(x, n) do
    cond do
      n == 0 -> 1
      n == 1 -> x
      n > 1 ->
        x * raise(x, n - 1)
      n < 0 ->
        1.0 / raise(x, -n)
    end
  end
end

