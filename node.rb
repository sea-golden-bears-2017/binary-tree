class Node

  class InvalidInsertionError < StandardError
  end

  attr_reader :data, :left, :right, :parent
  def initialize(data)
    @data = data
    @left = nil
    @right = nil
    @parent = nil
  end

  def create_child(data)
    raise InvalidInsertionError if data == @data
    child = Node.new(data)
    child.parent = self
    if data < @data
      raise InvalidInsertionError if @left
      @left = child
    else
      raise InvalidInsertionError if @right
      @right = child
    end
  end

  def detach
    if parent
      if parent.left == self
        parent.left = nil
      else
        parent.right = nil
      end
      @parent = nil
    end
  end

  protected
  attr_writer :parent, :left, :right
end
