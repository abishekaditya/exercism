module BookKeeping
  VERSION = 3
end

# run length encoding class
class RunLengthEncoding
  def self.encode(input)
    arr = input.scan(/(([\w ])\2*)/).map(&:first)
    arr.map { |i| contract(i) }.join('')
  end

  def self.contract(str)
    str.length == 1 ? str : str.length.to_s + str[0]
  end

  def self.decode(input)
    arr = input.scan(/([0-9]*[A-Za-z ])/).flatten
    x = arr.map { |i| expand(i) }.join('')
    x
  end

  def self.expand(str)
    head = str[0, str.length - 1].to_i
    head.zero? ? str : str[-1, 1] * head
  end
end
