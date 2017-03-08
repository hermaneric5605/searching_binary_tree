class Node
  attr_accessor :value, :parent, :left, :right

  def initialize(value, parent = nil, left = nil, right  = nil)
    @value = value 
    @parent = parent
    @left = left
    @right = right
  end

  # method to view the value of the node
  def to_s
    string = ""
    string += @parent.nil? ? "Parent: nil" : "Parent: #{@parent.value}"
    string += " Value: #{@value}"  
    string += @left.nil? ? " Left: nil" : " Left: #{@left.value}"
    string += @right.nil? ? " Right: nil" : " Right: #{@right.value}"
    return string
  end
end

class BinaryTree
  attr_accessor :root

  def initialize(ary)
    build_tree(ary)
  end

  # receives an array and builds a bst
  def build_tree(ary)
    index = 0
    @root = Node.new(ary[index])
    index += 1
    while index < ary.length
      insert(ary[index], @root)
      index += 1
    end
  end

  # inserts an item in the tree
  def insert(item, node = @root)
    if item < node.value
      if node.left.nil?
        left = Node.new(item, node)
        node.left = left
      else
        insert(item, node.left)
      end
    elsif item > node.value
      if node.right.nil?
        right = Node.new(item, node)
        node.right = right
      else
        insert(item, node.right)
      end
    end 
  end

  
  def breadth_first_search(item, node = @root, children = [])
    children << node.left if !node.left.nil?
    children << node.right if !node.right.nil?
    return node if item == node.value 
    return breadth_first_search(item, children.shift, children) if !children.empty?
    return nil
  end

  # non-recursive depth first with stack
  def depth_first_search(item)
    node = @root
    visited = []
    stack = []
    loop do
      if !node.left.nil? && !visited.include?(node)
        visited.push(node)
        stack.push(node)
        node = node.left
        next
      end
      return node if item == node.value 
      if !node.right.nil?
        node = node.right
        next
      end 
      break if stack.empty?
      node = stack.pop
    end
    return nil
  end
  
  # recursive depth first search
  def dfs_rec(item, node = @root)
    temp_node = dfs_rec(item, node.left) if !node.left.nil?
    return temp_node if temp_node
    return node if (item == node.value)
    temp_node = dfs_rec(item, node.right) if !node.right.nil?
    return temp_node if temp_node
    return nil
  end
  
  # print the tree in breadth first, left-to-right order 
  def print_tree()
    node = @root
    children = [node]
    loop do
      break if children.empty?
      children << children[0].left if !children[0].left.nil?
      children << children[0].right if !children[0].right.nil?
      print "#{children.shift.value}, "
    end
    puts ""
  end
end

ary1 = [1,2,3,4,5,6,7,8]
ary2 = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]

tree = BinaryTree.new(ary2)
tree.print_tree
puts tree.breadth_first_search(324)
puts tree.dfs_rec(67)
puts tree.depth_first_search(9)