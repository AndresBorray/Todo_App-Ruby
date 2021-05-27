require './item.rb'
require './list.rb'

class Todoboard
  def initialize(label)
    @list = Hash.new { |hash, key| hash[key] = List.new("#{key}")  }
  end
 
  def get_command
    puts 'Enter a command:'
    cmd, *args = gets.chomp.split(' ')
    case cmd
    when 'mklist'
      @list[*args] 
      true
    when 'ls'
      @list.each_key { |k| puts k }
      true
    when 'mktodo'
      selected_list = @list[args[0]]
      selected_list.add_item(args[1],args[2],*args[3])
      true 
    when 'showall'
      @list.each { |key,value| puts @list[key].print }
      true
    when 'up'
      lab = args[0]
      @list[lab].up(args[1].to_i,*args[2].to_i)
      true
    when 'down'
      lab = args[0]
      @list[lab].down(args[1].to_i,*args[2].to_i)
      true
    when 'swap'
      lab = args[0]
      @list[lab].swap(args[1].to_i, args[2].to_i )
      true
    when 'sort'
      lab = args[0]
      @list[lab].sort_by_date!
      true
    when 'priority'
      lab = args[0]
      p @list[lab].priority
      true
    when 'toggle'
        lab = args[0]
        @list[lab].toggle_item(args[1].to_i)
        true
    when 'purge'
      lab = args[0]
      @list[lab].purge 
      true
    when 'print'
      lab = args[0]
      index = args[1].to_i if !args[1].nil?
      if !index.nil? && @list[lab].valid_index?(index)
        @list[lab].print_full_item(index)
        true
      elsif index.nil?
        puts @list[lab].print
        true
      elsif !index.nil? && !@list[lab].valid_index?(index)
        puts @list[lab].print_full_item(index)
        true
      end
    when 'quit'
      false
    when 'rm'
      lab = args[0]
      @list[lab].rm(args[1].to_i)
    else 
      'Sorry, that command was not recognized.'
    end
  end

  def run
    flag = false
    until flag
      flag = true
      flag = false if get_command == true
    end
  end
end


l = Todoboard.new("MyBoard")
l.run

