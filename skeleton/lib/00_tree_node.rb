class PolyTreeNode
  
  attr_accessor :value, :children
  attr_reader :parent
  
  def initialize(new_node)
    @value = new_node
    @parent = nil 
    @children = []
  end 
  
  def parent=(parent_node)
    @parent.children.reject! { |kid| kid == self } unless @parent.nil?
    
    @parent = parent_node
    
    unless @parent.nil? || @parent.children.include?(self)
      @parent.children << self
    end
  end

  def add_child(child_node)
    unless @children.include?(child_node)
      child_node.parent = self
    end
  end
  
  def remove_child(child_node)
    child_node.parent = nil
    
    raise "You can't remove a parent!" unless @children.include?(child_node)
  end
  
  def dfs(target_value)
    @children.each do |kid|
      node_val = kid.dfs(target_value) if node_val.nil?
      
      return node_val unless node_val.nil?
    end
    
    return self if self.value == target_value
  end
  
  def bfs(target_value)
    queue = [self]
    
    until queue.empty?
      test_node = queue.shift
      return test_node if test_node.value == target_value
      test_node.children.each { |child| queue << child }    
    end  
  end
end