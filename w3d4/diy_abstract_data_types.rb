class Stack

    attr_reader :stack

    def initialize(stack)
      @stack = stack
    end

    def push(el)
      @stack.push(el)
    end

    def pop
      @stack.pop
    end

    def peek
      @stack[-1]
    end

end


class Queue

    attr_reader :queue

    def initialize(queue)
        @queue = queue
    end

    def enqueue(el)
        @queue.unshift(el)
    end

    def dequeue
        @queue.pop
    end

    def peek
        @queue[-1]
    end

end


class Map

    def initialize
        @map = Array.new {[]}
    end

    def set(key, value)

        @map.each do |pair|
            if pair[0].include?(key)
                pair[0] = key
                pair[1] = value
            end
        end

        @map << [key, value]
    end

    def get(key)

        @map.each do |pair|
            if pair[0].include?(key)
                return pair
            end
        end

        return nil

    end

    def delete(key)

        @map.each_with_index do |pair, i|
            if pair[0].include?(key)
                @map.delete_at(i)
            end
        end

    end

    def show
        @map
    end

end
