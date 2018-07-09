
def kth_largest(tree_node, k)
    tree = BinarySearchTree.new(tree_node)
    ordered_data = tree.in_order_traversal
    tree.find(ordered_data[k * -1])
end
