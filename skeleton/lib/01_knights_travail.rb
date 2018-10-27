require_relative "00_tree_node"
require "byebug"

class KnightPathFinder 
  MOVES = [[1,2],[2,1],[2,-1],[1,-2],[-1,-2],[-2,-1],[-2,1],[-1,2]]
  
  def initialize(start_pos)
    @start_pos = start_pos
    @root_node = PolyTreeNode.new(start_pos)
    @visited_positions = [start_pos]
    build_move_tree
  end

  def find_path(end_pos)
    # self.children.each do |kid|
    #   node_val = kid.dfs(target_value) if node_val.nil?
    # 
    #   return node_val unless node_val.nil?
    # end
    # 
    # return self if self.value == target_value
  end 
  
  def build_move_tree
    possible_moves = new_move_positions(@start_pos)
    
    until possible_moves.empty?
      current_pos = possible_moves.shift
      @visited_positions << current_pos unless @visited_positions.include?(current_pos) 
      
      child_node = PolyTreeNode.new(@visited_positions.last)
      
      @root_node.add_child(child_node)
      possible_moves += new_move_positions(@visited_positions.last).reject { |pos| possible_moves.include?(pos) } if @visited_positions.length < 64
      p possible_moves
    end
  end 
  
  def valid_moves(pos)
    valid_arr = []
    MOVES.each { |move| valid_arr << [move[0] + pos[0], move[1] + pos[1]] }
    valid_arr.select { |coord| coord[0].between?(0,7) && coord[1].between?(0,7) }
  end
  
  def new_move_positions(pos)
    valid_moves(pos).reject { |coord| @visited_positions.include?(coord) }
  end
end

kb = KnightPathFinder.new([0,0])
# p kb.find_path([5,1])

