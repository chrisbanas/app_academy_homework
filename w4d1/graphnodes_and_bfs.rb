class GraphNode

    attr_accessor :val, :neighbors

  def initialize(val)
    self.val = val
    self.neighbors = []
  end

#BFS
# data struct: queue
#initial status:
#   queue = starting_node
#   visitied = starting_node
#repeated step until queue is empty or we find the target
#   current_node = queue.pop()
#   if(current_node.val == targetvalue), return current_node.val
#   else visited current_node.neighbors and if the neighbor has not been visited, add it to queue and vistied


#general BFS question
# 1 always use queue
# 2 put the staring _node in the queue
# 3 until queue is empty
#       pop the current_node and do something(e.g check the current_node val...)
#       generate current_node.neighbours(deduplicate if necessary!!!) and put neightbors in queue
#that's all!

  def bfs(starting_node, target_value)

    return target_value if starting_node.val == target_value
    visited = [starting_node]
    queue = [starting_node]

    until queue.empty?
        current_node = queue.shift
        return target_value if current_node.val == target_value
        queue.concat(current_node.neighbors.select { |neighbor| visited.include?(neighbor) == false }) unless nil?
    end
    nil
  end

end



a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]

p e.bfs(a, "f")
