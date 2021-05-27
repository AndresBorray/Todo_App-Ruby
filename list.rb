require './item.rb'

class List
  attr_reader :label

  def initialize(label)
    @label = label
    @items = []
  end

  def [](index)
    return nil if @items[index].nil?
    @items[index]
  end

  def add_item(title, deadline, *description)
    description = "" if description.nil?
    begin
      item = Item.new(title, deadline, description)
    rescue RuntimeError
      false
    else
      @items << item
      true
    end
  end

  def size
    @items.length
  end

  def valid_index?(index)
    return false if (index > @items.length - 1) || (@items[index].nil?) || (index.to_i <= -1)
    true
  end

  def swap(index_1, index_2)
    if valid_index?(index_1) && valid_index?(index_2)
      @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
      true
    else
      false
    end
  end

  def priority
    return @items[0]
  end

  def print
    puts @label.center(50)
    puts "*".rjust(70, "*")
    puts "Index / Item".ljust(1) + "Deadline".rjust(50) + "Status".rjust(10)
    puts "_".rjust(70, "_")
    @items.each do |x|
      puts @items.index(x).to_s.ljust(6) + "/ " + x.title.ljust(5) + x.deadline.rjust(48) + x.status.to_s.rjust(8)
      puts
    end
  end

  def print_full_item(index)
    return "Sorry that item does not exist" if @items[index].nil?
    x = @items[index]
    puts "_".rjust(20, "_")
    puts "Todo: " + x.title 
    puts "_".rjust(40, "_")
    puts "Deadline: " + x.deadline.to_s
    puts
    if x.description.empty?
      puts "Description: Item has no description"
    else
      puts "Description: " + x.description.join("")
    end
    puts
    puts "Item completed? " + x.status.to_s
    puts "_".rjust(40, "_")
  end

  def print_priority
    print_full_item(0)
  end

  def up(index, *amount)
    return false if self[index].nil?
    if amount.length > 0
      amount = amount[0]
    else
      amount = 1
    end
    item = self[index]
    while amount != 0 && (self.priority != item)
      ix = @items.index(item)
      self.swap(ix, ix - 1)
      amount -= 1
    end
    return true
  end

  def down(index, *amount)
    return false if self[index].nil?
    if amount.length > 0
      amount = amount[0]
    else
      amount = 1
    end
    item = self[index]
    while amount != 0 && (self[-1] != item)
      ix = @items.index(item)
      self.swap(ix, ix + 1)
      amount -= 1
    end
    return true
  end

  def sort_by_date!
    @items.sort_by! { |x| x.deadline }
  end

  def toggle_item(index)
    item = @items[index]
    item.toggle
  end

  def rm(index)
    if @items[index].nil?
      "That item does not exist"
      false
    else
      @items.delete(@items[index])
      puts "Todo item successfully deleted!"
      true
    end
  end

  def purge
    count = 0
    @items.each.with_index do |ele,ix|
      if ele.done == true
        self.rm(ix)
        count += 1
      end
    end
    puts "#{count} items deleted."
  end
end

