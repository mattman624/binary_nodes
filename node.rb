
class Node
  attr_accessor :value, :parent_node, :left_node, :right_node, :midpoint

  def initialize(value, parent = nil)
    @value = value
    set_parent(parent)
  end
 

  def get_parent
    @parent_node
  end

  def set_parent(node)
    @parent_node = node
  end

  def set_children(left_node = nil, right_node = nil)
    @left_node = left_node.nil? ? nil : left_node
    @right_node = right_node.nil? ? nil : right_node
  end

  def get_left_node
    @left_node
  end

  def get_right_node
    @right_node
  end

end

def build_tree(array, parent = nil)
  size = array.size
  if size == 1 && !parent.nil?
    new_tree = Node.new(array[0], parent)
  elsif size == 1 && parent.nil?
    new_tree = Node.new(array[0])
  elsif size > 1
    array = merge_sort(array)
    midpoint = array.size / 2
    first_half = array[0..midpoint - 1]
    value = array[midpoint]
    second_half = array[midpoint + 1..-1]
    new_tree = Node.new(value, parent)    
    new_tree.set_children(build_tree(first_half, new_tree), build_tree(second_half, new_tree))    
  end
  new_tree
end

def merge_sort( array )
  
  n = array.size
  
  if n <= 1 
    return array  
  elsif n > 1  
    first_half = array[0..( n / 2 ) - 1]
    second_half = array[( n / 2 )..-1]
    new_array = merge( merge_sort(first_half), merge_sort(second_half) )
  end
  new_array
end

def merge(arr1=[], arr2=[])
  new_array = []
  arr1_size = arr1.nil? ? 0 : arr1.size
  arr2_size = arr2.nil? ? 0 : arr2.size
  
  while arr1_size >= 1 && arr2_size >= 1
    
    if arr1[0] > arr2[0]
      new_array << arr2[0]
      arr2 = arr2[1..-1]
    else
      new_array << arr1[0]
      arr1 = arr1[1..-1]
    end
    arr1_size = arr1.nil? ? 0 : arr1.size
    arr2_size = arr2.nil? ? 0 : arr2.size
    #puts new_array.join(", ")
  end
  if arr1_size > 0
    new_array = new_array  + arr1
  elsif arr2_size > 0
    new_array = new_array + arr2
  end
  new_array
end

def breadth_first_search(node, value)
  to_be_searched = []
  if node.nil?
    return nil
  elsif node.value == value
    return node
  else
    return_node = breadth_first_search(node.get_left_node, value)
    return_node = breadth_first_search(node.get_right_node, value) if return_node.nil?
  end
  return_node
end
