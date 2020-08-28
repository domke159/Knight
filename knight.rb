class Vertex
  attr_accessor :position, :next_moves, :parent

  def initialize(position, parent = nil)
    @position = position
    @parent = parent 
    @next_moves = []
    @next_moves << [@position[0] + 1, @position[1] + 2]
    @next_moves << [@position[0] + 1, @position[1] - 2]
    @next_moves << [@position[0] + 2, @position[1] + 1]
    @next_moves << [@position[0] + 2, @position[1] - 1]
    @next_moves << [@position[0] - 1, @position[1] + 2]
    @next_moves << [@position[0] - 1, @position[1] - 2]
    @next_moves << [@position[0] - 2, @position[1] + 1]
    @next_moves << [@position[0] - 2, @position[1] - 1]
    @next_moves.delete_if { |a, b| a < 0 || a > 7 || b < 0 || b > 7 }
  end 
end

def knight_moves(start, finish)
  queue = []
  current = Vertex.new(start)
  # Move to the end and keep track of parent of each Vertex
  until current.position == finish 
    current.next_moves.each { |pos| queue << Vertex.new(pos, current) }
    current = queue.shift
  end
  path = []
  # Move back to the start via parent
  until current.position == start 
    path << current.position
    current = current.parent 
  end 
  path << current.position
  # Returns the shortest path
  puts "You made it in #{path.length - 1} moves! Here's your path:"
  path.reverse.each { |pos| p pos }
end

# Tests
knight_moves([3,3], [4,3])
knight_moves([3,1],[3,5])
