class Stack



    def initialize(stack)
      @stack = stack

      # @stack = []
    end

    def push(el)
      @stack.push(el)
      # @stack << value
      # self (this self is not @stack but it is stack instance)
    end

    def pop
      @stack.pop
    end

    def peek
      @stack[-1]
      #@stack.last
    end

    def size
        stack.length
    end

    def empty?
        stack.empty?
    end

    def inspect # when ever self is returned this overwrites it so that we show something else. This is like how we overwrote the to_s method for how objects print to the console.
    #     # we need this here so that anytime self is returned, we can show only the object Id and keep the rest of the info private.
        "<#Stack:#{stack.object_id}>"
    #     # "<#Stack: @stack=[1,2,3]>" => what is usually seen
    end

    private #anything below private would be a private method so it has to be at the bottom or everything in the entire function would be private
    attr_reader :stack

end

p a = Stack.new([1,2,3])
p a

# the reason they set the getters and setters is because if you use @ and misspell it then Ruby thinks you are defining a new @ and won't raise an error.


class MyQueue

    # Ruby has a build in Queue so we have to make a custom MyQueue version / API



    def initialize(queue)
        @queue = queue
        @queue = []
    end

    def enqueue(el)
        @queue.unshift(el)
        self # this is to protect us from not returning the queue and instead return the class
    end

    def dequeue
        @queue.pop
    end

    def peek
        @queue[-1]
    end

    def show
        return queue.dup
        # this returns a copy of the queue array so users can't damage to the queue. Although if there are many nested arrays, you would have to deep dup it.

        # we could possibly just puts the queue out.
    end

    def empty?
        queue.empty?
    end

    private
    attr_reader :queue

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
