defmodule BinarySearchTree do
  @type bst_node :: %{data: any, left: bst_node | nil, right: bst_node | nil}

  @doc """
  Create a new Binary Search Tree with root's value as the given 'data'
  """
  @spec new(any) :: bst_node
  def new(data), do: %{data: data, left: nil, right: nil}

  @doc """
  Creates and inserts a node with its value as 'data' into the tree.
  """
  @spec insert(bst_node, any) :: bst_node
  def insert(tree, data)
  def insert(nil, data), do: new(data)

  def insert(%{left: left} = tree, data) when tree.data >= data do
    %{tree | left: insert(left, data)}
  end

  def insert(%{right: right} = tree, data) do
    %{tree | right: insert(right, data)}
  end

  defp do_in_order(output \\ [], tree)

  defp do_in_order(output, %{data: data, left: left, right: right}) do
    output
    |> do_in_order(right)
    |> (&[data | &1]).()
    |> do_in_order(left)
  end

  defp do_in_order(output, nil), do: output

  @doc """
  Traverses the Binary Search Tree in order and returns a list of each node's data.
  """
  @spec in_order(bst_node) :: [any]
  def in_order(tree), do: do_in_order(tree)
end
