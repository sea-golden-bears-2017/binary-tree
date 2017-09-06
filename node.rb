class Node
  attr_reader :data, :left
  def initialize(arguments)
    @data = arguments[:data]
    @left = nil
  end

  def create_child(data)
    child = Node.new({data: data})
    @left = child
  end
end
