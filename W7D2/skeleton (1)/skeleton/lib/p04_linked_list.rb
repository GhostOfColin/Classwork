class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

require "byebug"
class LinkedList

  include Enumerable

  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail 
    @tail.prev = @head 
  end

  def [](i)
    # debugger
    each_with_index { |node, j| return node if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    self.each do |node|
      return node.val if node.key == key
    end
  end

  def include?(key)
    self.each do |node|
      return true if node.key == key
    end
    false 
  end

  def append(key, val)
    new_node = Node.new(key, val)
    current_last = @tail.prev
    current_last.next = new_node
    new_node.prev = current_last
    new_node.next = @tail
    @tail.prev = new_node
  end

  # head -> :zero -> tail
  # head <- :zero <- tail

  # head -> :zero -> :first -> tail
  # head <- :zero <- :first <- tail

  def update(key, val)
    self.each do |node|
      if node.key == key
        node.val = val
      end
    end
  end

  def remove(key)
    if self.include?(key)
      scrap_node = nil
      self.each do |node|
        
        if node.key == key
          scrap_node = node
          # debugger
        end
      end
      
      right_node = scrap_node.prev
      left_node = scrap_node.next

      right_node.next = left_node
      left_node.prev = right_node
    end
  end

  def each
    start = first
    until start == @tail  
      yield start
      start = start.next
    end
  end

  #uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end


