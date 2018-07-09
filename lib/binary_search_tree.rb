# There are many ways to implement these methods, feel free to add arguments 
# to methods as you see fit, or to create helper methods.

class BinarySearchTree
  attr_accessor :root
  def initialize(root = nil)
    @root = root
  end

  def insert(value)
    node = BSTNode.new(value)
    unless @root 
      @root = node 
    else 
      place_node(node)
    end 
  end

  def find(value, root = @root)
    return root if root.value == value

    if value <= root.value 
      node = find(value, root.left) if root.left
    else
      node = find(value, root.right) if root.right
    end 

    node
  end

  def delete(value)
    node = find(value)
    if node.left == nil && node.right == nil
      if  @root == node 
        @root = nil
      else
        replace(node)
     end 
    elsif [node.left, node.right].compact.length == 1
      child_node = [node.left, node.right].compact.first
      replace(node, child_node)
    elsif node.left && node.right
      max = maximum(node.left)
      replace(node, max)
      max_child = max.left
      if max_child 
        max_child.parent = node.left
        max_child = max.left
        node.left.right = max_child
      end 
      max.left = node.left
      node.left.parent = max

    end 
  end

  # helper method for #delete:
  def maximum(root = @root)
    return root if root.right.nil?
    maximum(root.right)
  end

  def depth(root = @root)
    height(root) - 1
  end 

  def is_balanced?(root = @root)
    return true if root == nil
    right_depth = depth(root.right)
    left_depth = depth(root.left)
    difference = (right_depth - left_depth).abs
    is_balanced?(root.left) && is_balanced?(root.right) && difference < 2
  end

  def in_order_traversal(root = @root, arr = [])
    if root
      in_order_traversal(root.left, arr)
      arr.push(root.value)
      in_order_traversal(root.right, arr)
    end 
    arr
  end


  private
  # optional helper methods go here:
  def place_node(node, root = @root)
    if node.value <= root.value 
      if root.left == nil
        node.parent = root
        root.left = node
        return 
      end 
      place_node(node, root.left)
    else 
      if root.right == nil 
        node.parent = root
        root.right = node
        return 
      end 
      place_node(node, root.right)
    end 

  end

  def replace(node, r = nil)
    if node.value <= node.parent.value
      node.parent.left = r
    else 
      node.parent.right = r
    end 
  end 

  def height(root)
    return 0 if root == nil
    [height(root.left), height(root.right)].max + 1
  end 
end
