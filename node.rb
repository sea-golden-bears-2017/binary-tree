class Node

  class InvalidInsertionError < StandardError
  end

  attr_reader :data, :left, :right, :parent
  def initialize(arguments)
    @data = arguments[:data]
    @left = nil
    @right = nil
    @parent = nil
  end

  def create_child(data)
    raise InvalidInsertionError if data == @data
    child = Node.new({data: data})
    if data < @data
      raise InvalidInsertionError if @left
      @left = child
    else
      raise InvalidInsertionError if @right
      @right = child
    end
  end
end
