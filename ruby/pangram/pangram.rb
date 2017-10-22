require 'set'

module BookKeeping
  VERSION = 5
end

# checks whether sentence contains all the letters of the alphabet
class Pangram
  def self.pangram?(phrase)
    list = phrase.split('').map(&:downcase).to_set
    ('a'..'z').to_set.subset? list
  end
end
