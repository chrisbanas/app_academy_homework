require 'byebug'

class Pet

    attr_reader :name

    @@total_pets = 0 # class variables are inhearted

    def initialize(name)
        @name = name
    end

    # @total_pets - instance variable are not inhearted

end

class Dog < Pet

    @breeds = ['cockapoo', 'golden', 'pit', 'hound'] # class instance variable. Variable definied on the class itself

    puts "line 10 + #{self}" # Dog class ? < this is running during the class definition

    def self.doggie_things
        puts self # self is = to Dog
        p @@total_pets
    end


    def initialize(name) # variables defined on the instance of the class DOG
        super(name) # name is an instance variable
        @secret = "I'm a goat in disguise" # is an instance variable
        @@total_pets += 1 # increments this everytime we make a new pet
    end

    def sleep
        puts "sleeping!"
    end

    def eat
        puts "eating!"
    end

    def drink
        puts "drinking!"
    end

    def trick
        puts "BACK FLIP!!"
    end

    def who_am_id
        puts self # whenever we are dealing with self the value is just the receiver
    end

    private # even though this is private calling instance_variable_get/set will pull it out
    attr_reader :secret

    def tell_secret

    end


# this will override this method so that people can't call it

    # def instance_variable_set
    #     puts 'nice try werdio'
    # end

end

# Dog is an instance of class and fido is an instance of Dog

puts "here am I"
# Dog.doggie_things # 0
fido = Dog.new('Fido')
jenny = Dog.new('Jenny')
# Dog.doggie_things # 1
fido.who_am_id
fido.eat
p fido.name
p jenny.name


p Dog.ancestors # < shows the inherentace of the class

# these methods are not for the public interface but more as developer tools for writing things like tests and working in rails.

# instance_variable_get - can get out instance variables every if they are under private
p fido.instance_variable_get(:@secret)
p jenny.instance_variable_get("@secret")


# instance_variable_set - can reset a variable
fido.instance_variable_set(:@secret, "I am actually a donkey in disquise")
p fido.instance_variable_get(:@secret)


# .send(method, *args)

# is a method that takes a method name and *args. An alternative way of invoking a method. It allows us to dynamically invoke a method. Send bypasses public and private keywords.

# send also allows you to invoke a function without knowing what it is. You can pass functions through send to variables inside other functions

# def this_that(this, that)
#     send(this)
#     send(that)
# end

# both are the same
# fido.eat
# fido.send('eat)

# bypassing private
# fido.tell_secret - will not work
# fido.send(:tell_secret) - this will work

# define_method('name of the method you want to create', 'the behavior we want to associate with it defined inside a block)
# is an instance method that is defined on all class instances
