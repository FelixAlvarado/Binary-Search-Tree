
def kth_largest(tree_node, k)

end

# extra problems asking to find the least common ancestor of two given nodes
def lca(node1, node2, parent)
    node_arr = [node1, node2]
    return parent if (node_arr.min.value <= parent.value && node_arr.max.value > parent.value)
    return parent if (node_arr.min.value <= parent.value && node_arr.max.value == parent.value)
    return lca(node1,node2, parent.left) if (node1.value <= parent.value && node2.value <= parent.value)
    return lca(node1,node2, parent.right) if (node1.value > parent.value && node2.value > parent.value)
end 