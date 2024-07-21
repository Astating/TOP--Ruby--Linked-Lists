class Node
  attr_accessor :value, :next_node

  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  attr_reader :root

  @root = nil

  def append(value)
    if @root.nil?
      @root = Node.new(value)
    else
      tail.next_node = Node.new(value)
    end
  end

  def prepend(value)
    @root = Node.new(value, @root)
  end

  def insert_at(value, index)
    return prepend(value) if index.zero?

    prev_node = at(index - 1)
    return unless prev_node

    prev_node.next_node = Node.new(value, prev_node.next_node)
  end

  def remove_at(index)
    return @root = @root&.next_node if index.zero?

    prev_node = at(index - 1)
    return unless prev_node&.next_node

    prev_node.next_node = prev_node.next_node.next_node
  end

  def size
    node = @root
    size = 0

    while node
      size += 1
      node = node.next_node
    end

    size
  end

  def head
    @root
  end

  def tail
    return unless @root

    node = @root
    node = node.next_node while node.next_node

    node
  end

  def at(index)
    node = @root

    index.times do
      return unless node

      node = node&.next_node
    end

    node
  end

  def pop
    if @root&.next_node.nil?
      @root = nil
      return
    end

    node = @root
    node = node.next_node while node&.next_node&.next_node

    node.next_node = nil
  end

  def contains?(value)
    !find(value).nil?
  end

  def find(value)
    node = @root
    index = 0

    while node
      return index if node.value == value

      node = node&.next_node
      index += 1
    end

    nil
  end

  def to_s
    node = @root
    string = ''

    until node&.value.nil?
      string += "( #{node.value} ) -> "
      node = node.next_node
    end

    string + 'nil'
  end
end
