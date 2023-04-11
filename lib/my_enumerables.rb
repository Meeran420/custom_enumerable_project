module Enumerable
  # Your code goes here
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    return self unless block_given?

    for value in self do
      yield value
    end

    self
  end

  def my_each_with_index
    return self unless block_given?

    i = 0
    for value in self do
      yield value, i
      i += 1
    end

    self
  end

  def my_select
    return self unless block_given?
    arr = []

    my_each { |value| arr << value if yield value}

    arr
  end

  def my_all?
    unless block_given?
      my_each { |v| return false unless v}
      return true
    else
      my_each { |v| return false unless yield v}
      return true
    end
  end
end
