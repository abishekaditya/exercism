module BookKeeping
  VERSION = 3
end

# Hamming Code
class Hamming
  def self.compute(str1, str2)
    raise ArgumentError if str1.length != str2.length
    ar1 = str1.split('')
    ar2 = str2.split('')

    (0..ar1.length).count do |i|
      ar1[i] != ar2[i]
    end
  end
end
