module BookKeeping
  VERSION = 1
end

# grains in a chessboard
class Grains
  def self.square(number)
    raise ArgumentError if number > 64 || number < 1
    2**(number - 1)
  end

  def self.total
    (1..64).reduce(0) { |acc, i| acc + square(i) }
  end
end
