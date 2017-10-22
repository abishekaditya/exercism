module BookKeeping
  VERSION = 3
end

# number to string based on factors
class Raindrops
  def self.convert(number)
    str = ''
    str += 'Pling' if (number % 3).zero?
    str += 'Plang' if (number % 5).zero?
    str += 'Plong' if (number % 7).zero?
    str == '' ? number.to_s : str
  end
end
