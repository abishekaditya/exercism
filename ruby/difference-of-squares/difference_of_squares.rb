module BookKeeping
  VERSION = 4
end

# summation and squaring operations for range
class Squares
  def initialize(limit)
    @limit = limit
  end

  def sum_of_squares
    (1..@limit).reduce(0) { |a, i| a + (i * i) }
  end

  def square_of_sum
    (1..@limit).sum**2
  end

  def difference
    square_of_sum - sum_of_squares
  end
end
