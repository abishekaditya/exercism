module BookKeeping
  VERSION = 3
end
# binary number class
class Binary
  def self.to_decimal(str)
    len = str.length
    values = []

    check(str)

    arr = str.split('').map(&:to_i)
    arr.each_with_index { |val, ind| values << val * (2**(len - ind - 1)) }
    values.reduce(:+)
  end

  def self.check(str)
    arr = str.split('')
    raise ArgumentError unless arr.all? { |i| i == '0' || i == '1' }
  end
end
