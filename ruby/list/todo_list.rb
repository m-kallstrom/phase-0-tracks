class TodoList
  attr_reader :get_items

  def initialize(new_array)
    @get_items = new_array
  end

  def add_item(item)
    @get_items << item
  end

  def delete_item(item)
    @get_items.delete(item)
  end

  def get_single_item(index)
    get_items[index]
  end
end

#In phase-0-tracks/ruby/list, you'll find a test file for a TodoList class. The class itself isn't anything fancy -- it basically maintains an internal array attribute and provides methods that allow the array to be accessed and updated in various ways.

