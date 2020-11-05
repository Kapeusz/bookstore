defmodule CustomSQLFunctions do
  defmacro concat(left, mid, right) do
    quote do
      fragment("concat(?, ?, ?)", unquote(left), unquote(mid), unquote(right))
    end
  end
end
