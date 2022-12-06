require_relative 'node'

class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
    # @tail = nil
  end

  def append(value)
    return @head = Node.new(value) if head.nil?

    tail.next_node = Node.new(value)
  end

  def prepend(value)
    @head = Node.new(value, @head)
  end

  def size
    i = 0
    current_node = head
    until current_node.nil?
      i += 1
      current_node = current_node.next_node
    end
    i
  end

  def tail
    current_node = head
    current_node = current_node.next_node until current_node.next_node.nil?
    current_node
  end

  def at(index)
    current_node = head
    while index.positive? && !current_node.nil?
      current_node = current_node.next_node
      index -= 1
    end
    current_node
  end

  def pop
    # p "-"
    return if head.nil?
    return self.head = nil if head.next_node.nil?

    previous_node = head
    current_node = head.next_node
    until current_node.next_node.nil?
      previous_node = current_node
      current_node = current_node.next_node
    end
    previous_node.next_node = nil
    current_node
  end

  def contains?(value)
    current_node = head
    until current_node.next_node.nil?
      return false if current_node.value == value

      current_node = current_node.next_node
    end
    true
  end

  def find(value)
    i = 0
    current_node = head
    until current_node.nil?
      return i if current_node.value == value

      i += 1
      current_node = current_node.next_node
    end
    nil
  end

  def to_s
    str = 'Linked List : head -> '
    unless head.nil?

      current_node = head
      until current_node.nil?
        str += "(#{current_node.value}) -> "
        current_node = current_node.next_node
      end
    end
    "#{str} nil"
  end

  def insert_at(value, index)
    return @head = Node.new(value, head) if index <= 0

    before_node = at(index - 1)
    before_node.next_node = Node.new(value, before_node.next_node)
  end

  def remove_at(index)
    return @head = head.next_node if index <= 0

    before_node = at(index - 1)
    before_node.next_node = before_node.next_node.next_node
  end
end

list1 = LinkedList.new
list1.append(2813)
list1.append(2)
list1.append(3)
list1.append(90)
list1.append(4)
list1.prepend(1)
puts list1
list1.insert_at(69, 0)
puts list1
p list1.remove_at(1)
puts list1
