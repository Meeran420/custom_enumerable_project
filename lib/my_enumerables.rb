module Enumerable

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

  def my_any?
    return self unless block_given?

    my_each { |v| return true if yield v}
    return false
  end

  def my_none?
    return self unless block_given?

    my_each { |v| return false if yield v}

    true
  end

  def my_count
    return self.length unless block_given?

    c = 0
    my_each { |v| c += 1 if yield v}
    
    return c
  end

  def my_map(&block)
    return self unless block_given?

    arr = []
    my_each { |v| arr << block.call(v)}
    arr
  end

end

class Array

  def my_each
    return self unless block_given?

    for value in self do
      yield value
    end

    self
  end

end
