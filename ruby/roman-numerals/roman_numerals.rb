module BookKeeping
  VERSION = 2
end

# Integer to Roman numerals
class Integer
  MAPPING = {
    1000 => 'M',
    900 => 'CM',
    500 => 'D',
    400 => 'CD',
    100 => 'C',
    90 => 'XC',
    50 => 'L',
    40 => 'XL',
    10 => 'X',
    9 => 'IX',
    5 => 'V',
    4 => 'IV',
    1 => 'I'
  }.freeze

  def to_roman
    number = self
    roman = ''
    MAPPING.each_pair do |num, str|
      while number >= num
        number -= num
        roman << str
      end
    end
    roman
  end
end
