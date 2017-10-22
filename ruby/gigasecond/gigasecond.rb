module BookKeeping
  VERSION = 6
end

# Giga second class
class Gigasecond
  def self.from start
    Time.at(start.to_f + (10**9))
  end
end
