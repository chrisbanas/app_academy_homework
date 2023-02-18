class Node

    attr_reader :value, :children

    def initialize(value, childern = [])
        @value = value
        @childern = children
    end

end

d = Node.new("d")
e = Node.new("e")
f = Node.new("f")
g = Node.new("g")
b = Node.new("b", [d, e])
c = Node.new("c", [f, g])
a = Node.new("a", [b, c])



    #     a
    #    / \
    #   b   c
    #  /\   /\
    # d  e f  g



def dfs(target = nil, &prc)
    prc ||= Proc.new{ |node| node.value == target }
    return self if prc.call(self)

    self.children.each do |child|
        search = child.dfs(target, &prc)
        return search unless search.nil?
    end

    nil

end



def bfs(target = nil, &prc)
    prc ||= Proc.new{ |node| node.value == target }

    nodes_queue = [self]

    until nodes_queue.empty?
        node = node_queue.shift
        return node if prc.call(node)
        nodes_queue.concat(node.childern)
    end

    nil

end
